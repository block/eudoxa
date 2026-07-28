0.12::indep(s_m).
0.15::indep(s45).
0.20::indep(s43).
0.25::indep(s38).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values lib_tech=Lib_Tech unk_brand=Unknown
% @importance 0.93

0.92::acc(s1, brand).
0.88::acc(s_m, brand).

0.97::true_val(brand, lib_tech); 0.03::true_val(brand, unk_brand).

measured(s1, brand, lib_tech).
measured(s_m, brand, lib_tech).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s_m), consistent(s_m, brand) ; \+indep(s_m)).

evidence(all_consistent(brand)).
query(true_val(brand, lib_tech)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values golden_orca=Golden_Orca lib_tech_trice_golden_orca=Lib_Tech_T_Rice_Golden_Orca
% @importance 0.93

0.90::acc(s1, model_name).
0.88::acc(s_m, model_name).
0.90::acc(s2, model_name).

0.55::true_val(model_name, golden_orca); 0.45::true_val(model_name, lib_tech_trice_golden_orca).

measured(s1, model_name, golden_orca).
measured(s_m, model_name, golden_orca).
measured(s2, model_name, lib_tech_trice_golden_orca).

all_consistent(model_name) :-
    consistent(s1, model_name),
    consistent(s2, model_name),
    (indep(s_m), consistent(s_m, model_name) ; \+indep(s_m)).

evidence(all_consistent(model_name)).
query(true_val(model_name, golden_orca)).
query(true_val(model_name, lib_tech_trice_golden_orca)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2027=2027 unk_model_year=Unknown
% @importance 0.93

0.95::acc(s1, model_year).
0.90::acc(s_m, model_year).

0.97::true_val(model_year, y2027); 0.03::true_val(model_year, unk_model_year).

measured(s1, model_year, y2027).
measured(s_m, model_year, y2027).

all_consistent(model_year) :-
    consistent(s1, model_year),
    (indep(s_m), consistent(s_m, model_year) ; \+indep(s_m)).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2027)).
query(true_val(model_year, unk_model_year)).

% @attr model_series
% @type categorical
% @canonical false
% @original_name Model series
% @values orca_family_travis_rice=Orca_family_Travis_Rice_Collection unk_model_series=Unknown
% @importance 0.70

0.90::acc(s3, model_series).

0.81::true_val(model_series, orca_family_travis_rice); 0.19::true_val(model_series, unk_model_series).

measured(s3, model_series, orca_family_travis_rice).

all_consistent(model_series) :- consistent(s3, model_series).

evidence(all_consistent(model_series)).
query(true_val(model_series, orca_family_travis_rice)).
query(true_val(model_series, unk_model_series)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 1.0

0.95::acc(s1, product_type).

0.97::true_val(product_type, snowboard); 0.03::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).

all_consistent(product_type) :- consistent(s1, product_type).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_directional=All_Mountain_Directional freeride_powder=Freeride_Powder freestyle_powder_dir_freeride=Freestyle_Powder_Directional_Freeride
% @importance 0.82

0.93::acc(s4, board_category).
0.78::acc(s_m, board_category).
0.75::acc(s5, board_category).

0.50::true_val(board_category, all_mountain_directional); 0.30::true_val(board_category, freeride_powder); 0.20::true_val(board_category, freestyle_powder_dir_freeride).

measured(s4, board_category, all_mountain_directional).
measured(s_m, board_category, freeride_powder).
measured(s5, board_category, freestyle_powder_dir_freeride).

all_consistent(board_category) :-
    consistent(s4, board_category),
    consistent(s5, board_category),
    (indep(s_m), consistent(s_m, board_category) ; \+indep(s_m)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_directional)).
query(true_val(board_category, freeride_powder)).
query(true_val(board_category, freestyle_powder_dir_freeride)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values mens=Mens unk_gender=Unknown
% @importance 0.50

0.80::acc(s6, gender).

0.63::true_val(gender, mens); 0.37::true_val(gender, unk_gender).

measured(s6, gender, mens).

all_consistent(gender) :- consistent(s6, gender).

evidence(all_consistent(gender)).
query(true_val(gender, mens)).
query(true_val(gender, unk_gender)).

% @attr model_first_available_year
% @type categorical
% @canonical true
% @original_name model_first_available_year
% @values season_2021_2022=2021_2022_season unk_model_first_available_year=Unknown
% @importance 0.75

0.85::acc(s7, model_first_available_year).

0.76::true_val(model_first_available_year, season_2021_2022); 0.24::true_val(model_first_available_year, unk_model_first_available_year).

measured(s7, model_first_available_year, season_2021_2022).

all_consistent(model_first_available_year) :- consistent(s7, model_first_available_year).

evidence(all_consistent(model_first_available_year)).
query(true_val(model_first_available_year, season_2021_2022)).
query(true_val(model_first_available_year, unk_model_first_available_year)).

% @attr estimated_availability_date
% @type categorical
% @canonical true
% @original_name estimated_availability_date
% @values preorder_spring_2026=Preorder_spring_2026 unk_estimated_availability_date=Unknown
% @importance 0.93

0.93::acc(s1, estimated_availability_date).

0.92::true_val(estimated_availability_date, preorder_spring_2026); 0.08::true_val(estimated_availability_date, unk_estimated_availability_date).

measured(s1, estimated_availability_date, preorder_spring_2026).

all_consistent(estimated_availability_date) :- consistent(s1, estimated_availability_date).

evidence(all_consistent(estimated_availability_date)).
query(true_val(estimated_availability_date, preorder_spring_2026)).
query(true_val(estimated_availability_date, unk_estimated_availability_date)).

% @attr redesign_year
% @type categorical
% @canonical false
% @original_name redesign_year
% @values new_hemlock_core_pbt_topsheet=New_Hemlock_core_PBT_topsheet_minimal_shape_changes unk_redesign_year=Unknown
% @importance 0.80

0.82::acc(s8, redesign_year).

0.69::true_val(redesign_year, new_hemlock_core_pbt_topsheet); 0.31::true_val(redesign_year, unk_redesign_year).

measured(s8, redesign_year, new_hemlock_core_pbt_topsheet).

all_consistent(redesign_year) :- consistent(s8, redesign_year).

evidence(all_consistent(redesign_year)).
query(true_val(redesign_year, new_hemlock_core_pbt_topsheet)).
query(true_val(redesign_year, unk_redesign_year)).

% @attr pro_rider_name
% @type categorical
% @canonical true
% @original_name pro_rider_name
% @values travis_rice=Travis_Rice unk_pro_rider_name=Unknown
% @importance 1.0

0.95::acc(s1, pro_rider_name).

0.97::true_val(pro_rider_name, travis_rice); 0.03::true_val(pro_rider_name, unk_pro_rider_name).

measured(s1, pro_rider_name, travis_rice).

all_consistent(pro_rider_name) :- consistent(s1, pro_rider_name).

evidence(all_consistent(pro_rider_name)).
query(true_val(pro_rider_name, travis_rice)).
query(true_val(pro_rider_name, unk_pro_rider_name)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values dulk=Dulk_dulk1 unk_graphic_designer_artist=Unknown
% @importance 0.25

0.95::acc(s9, graphic_designer_artist).

0.90::true_val(graphic_designer_artist, dulk); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s9, graphic_designer_artist, dulk).

all_consistent(graphic_designer_artist) :- consistent(s9, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, dulk)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values mervin_manufacturing=Mervin_Manufacturing unk_manufacturer=Unknown
% @importance 0.70

0.85::acc(s10, manufacturer).

0.72::true_val(manufacturer, mervin_manufacturing); 0.28::true_val(manufacturer, unk_manufacturer).

measured(s10, manufacturer, mervin_manufacturing).

all_consistent(manufacturer) :- consistent(s10, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, mervin_manufacturing)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values sequim_wa_usa=Sequim_Washington_USA unk_manufacturing_location_current=Unknown
% @importance 0.60

0.90::acc(s11, manufacturing_location_current).

0.86::true_val(manufacturing_location_current, sequim_wa_usa); 0.14::true_val(manufacturing_location_current, unk_manufacturing_location_current).

measured(s11, manufacturing_location_current, sequim_wa_usa).

all_consistent(manufacturing_location_current) :- consistent(s11, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, sequim_wa_usa)).
query(true_val(manufacturing_location_current, unk_manufacturing_location_current)).

% @attr parent_company
% @type categorical
% @canonical false
% @original_name Parent company
% @values spring_capital_group=Spring_Capital_Group unk_parent_company=Unknown
% @importance 0.45

0.75::acc(s12, parent_company).

0.67::true_val(parent_company, spring_capital_group); 0.33::true_val(parent_company, unk_parent_company).

measured(s12, parent_company, spring_capital_group).

all_consistent(parent_company) :- consistent(s12, parent_company).

evidence(all_consistent(parent_company)).
query(true_val(parent_company, spring_capital_group)).
query(true_val(parent_company, unk_parent_company)).

% @attr mervin_founding
% @type categorical
% @canonical false
% @original_name Mervin founding
% @values founded_1977_olson_saari=Founded_1977_Mike_Olson_Pete_Saari unk_mervin_founding=Unknown
% @importance 0.35

0.90::acc(s13, mervin_founding).

0.86::true_val(mervin_founding, founded_1977_olson_saari); 0.14::true_val(mervin_founding, unk_mervin_founding).

measured(s13, mervin_founding, founded_1977_olson_saari).

all_consistent(mervin_founding) :- consistent(s13, mervin_founding).

evidence(all_consistent(mervin_founding)).
query(true_val(mervin_founding, founded_1977_olson_saari)).
query(true_val(mervin_founding, unk_mervin_founding)).

% @attr manufacturing_distinction
% @type categorical
% @canonical false
% @original_name Manufacturing distinction
% @values last_major_usa_factory=Last_major_board_building_factory_in_USA unk_manufacturing_distinction=Unknown
% @importance 0.60

0.85::acc(s14, manufacturing_distinction).

0.77::true_val(manufacturing_distinction, last_major_usa_factory); 0.23::true_val(manufacturing_distinction, unk_manufacturing_distinction).

measured(s14, manufacturing_distinction, last_major_usa_factory).

all_consistent(manufacturing_distinction) :- consistent(s14, manufacturing_distinction).

evidence(all_consistent(manufacturing_distinction)).
query(true_val(manufacturing_distinction, last_major_usa_factory)).
query(true_val(manufacturing_distinction, unk_manufacturing_distinction)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values zero_waste_hydro_biodiesel=Zero_hazardous_waste_89pt6pct_hydroelectric_biodiesel unk_sustainability_certification=Unknown
% @importance 0.50

0.82::acc(s15, sustainability_certification).

0.70::true_val(sustainability_certification, zero_waste_hydro_biodiesel); 0.30::true_val(sustainability_certification, unk_sustainability_certification).

measured(s15, sustainability_certification, zero_waste_hydro_biodiesel).

all_consistent(sustainability_certification) :- consistent(s15, sustainability_certification).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, zero_waste_hydro_biodiesel)).
query(true_val(sustainability_certification, unk_sustainability_certification)).

% @attr price_usd_msrp
% @type numeric
% @canonical true
% @original_name price_usd_msrp
% @unit USD
% @values v849_99=849.99 v849=849.0
% @importance 0.95

0.95::acc(s16, price_usd_msrp).
0.85::acc(s17, price_usd_msrp).

0.55::true_val(price_usd_msrp, v849_99); 0.45::true_val(price_usd_msrp, v849).

measured(s16, price_usd_msrp, v849_99).
measured(s17, price_usd_msrp, v849).

all_consistent(price_usd_msrp) :-
    consistent(s16, price_usd_msrp),
    consistent(s17, price_usd_msrp).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v849_99)).
query(true_val(price_usd_msrp, v849)).

% @attr price_aud_merchant
% @type numeric
% @canonical false
% @original_name price_aud_merchant
% @unit AUD
% @values v1399_99=1399.99 unk_price_aud_merchant=Unknown
% @importance 0.85

0.93::acc(s_m, price_aud_merchant).

0.95::true_val(price_aud_merchant, v1399_99); 0.05::true_val(price_aud_merchant, unk_price_aud_merchant).

measured(s_m, price_aud_merchant, v1399_99).

all_consistent(price_aud_merchant) :- consistent(s_m, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v1399_99)).
query(true_val(price_aud_merchant, unk_price_aud_merchant)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values preorder_may_2026=Preorder_estimated_May_1_2026 unk_availability_status=Unknown
% @importance 0.85

0.90::acc(s_m, availability_status).

0.95::true_val(availability_status, preorder_may_2026); 0.05::true_val(availability_status, unk_availability_status).

measured(s_m, availability_status, preorder_may_2026).

all_consistent(availability_status) :- consistent(s_m, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, preorder_may_2026)).
query(true_val(availability_status, unk_availability_status)).

% @attr price_usd_msrp_2022
% @type numeric
% @canonical false
% @original_name price_usd_msrp (2022)
% @unit USD
% @values v749_95=749.95 unk_price_usd_msrp_2022=Unknown
% @importance 0.60

0.72::acc(s18, price_usd_msrp_2022).

0.63::true_val(price_usd_msrp_2022, v749_95); 0.37::true_val(price_usd_msrp_2022, unk_price_usd_msrp_2022).

measured(s18, price_usd_msrp_2022, v749_95).

all_consistent(price_usd_msrp_2022) :- consistent(s18, price_usd_msrp_2022).

evidence(all_consistent(price_usd_msrp_2022)).
query(true_val(price_usd_msrp_2022, v749_95)).
query(true_val(price_usd_msrp_2022, unk_price_usd_msrp_2022)).

% @attr price_usd_evo
% @type numeric
% @canonical true
% @original_name price_usd_evo
% @unit USD
% @values v594_99=594.99 unk_price_usd_evo=Unknown
% @importance 0.85

0.85::acc(s19, price_usd_evo).

0.72::true_val(price_usd_evo, v594_99); 0.28::true_val(price_usd_evo, unk_price_usd_evo).

measured(s19, price_usd_evo, v594_99).

all_consistent(price_usd_evo) :- consistent(s19, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v594_99)).
query(true_val(price_usd_evo, unk_price_usd_evo)).

% @attr price_usd_rei
% @type numeric
% @canonical true
% @original_name price_usd_rei
% @unit USD
% @values v594_83=594.83 unk_price_usd_rei=Unknown
% @importance 0.85

0.78::acc(s20, price_usd_rei).

0.56::true_val(price_usd_rei, v594_83); 0.44::true_val(price_usd_rei, unk_price_usd_rei).

measured(s20, price_usd_rei, v594_83).

all_consistent(price_usd_rei) :- consistent(s20, price_usd_rei).

evidence(all_consistent(price_usd_rei)).
query(true_val(price_usd_rei, v594_83)).
query(true_val(price_usd_rei, unk_price_usd_rei)).

% @attr price_usd_backcountry
% @type numeric
% @canonical true
% @original_name price_usd_backcountry
% @unit USD
% @values v679_99=679.99 unk_price_usd_backcountry=Unknown
% @importance 0.85

0.78::acc(s20b, price_usd_backcountry).

0.56::true_val(price_usd_backcountry, v679_99); 0.44::true_val(price_usd_backcountry, unk_price_usd_backcountry).

measured(s20b, price_usd_backcountry, v679_99).

all_consistent(price_usd_backcountry) :- consistent(s20b, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v679_99)).
query(true_val(price_usd_backcountry, unk_price_usd_backcountry)).

% @attr price_christy_sports_prior
% @type categorical
% @canonical false
% @original_name Prior year (2025/2026) price at Christy Sports
% @unit USD
% @values v595_97_to_679_99=595.97_to_679.99 unk_price_christy_sports_prior=Unknown
% @importance 0.75

0.70::acc(s21, price_christy_sports_prior).

0.49::true_val(price_christy_sports_prior, v595_97_to_679_99); 0.51::true_val(price_christy_sports_prior, unk_price_christy_sports_prior).

measured(s21, price_christy_sports_prior, v595_97_to_679_99).

all_consistent(price_christy_sports_prior) :- consistent(s21, price_christy_sports_prior).

evidence(all_consistent(price_christy_sports_prior)).
query(true_val(price_christy_sports_prior, v595_97_to_679_99)).
query(true_val(price_christy_sports_prior, unk_price_christy_sports_prior)).

% @attr price_cad_one_boardshop
% @type numeric
% @canonical false
% @original_name Price at ONE Boardshop (2027)
% @unit CAD
% @values v1099_99=1099.99 unk_price_cad_one_boardshop=Unknown
% @importance 0.75

0.72::acc(s22, price_cad_one_boardshop).

0.59::true_val(price_cad_one_boardshop, v1099_99); 0.41::true_val(price_cad_one_boardshop, unk_price_cad_one_boardshop).

measured(s22, price_cad_one_boardshop, v1099_99).

all_consistent(price_cad_one_boardshop) :- consistent(s22, price_cad_one_boardshop).

evidence(all_consistent(price_cad_one_boardshop)).
query(true_val(price_cad_one_boardshop, v1099_99)).
query(true_val(price_cad_one_boardshop, unk_price_cad_one_boardshop)).

% @attr price_eur_blue_tomato
% @type numeric
% @canonical true
% @original_name price_eur_blue_tomato
% @unit EUR
% @values v629=629.0 unk_price_eur_blue_tomato=Unknown
% @importance 0.70

0.68::acc(s23, price_eur_blue_tomato).

0.49::true_val(price_eur_blue_tomato, v629); 0.51::true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato).

measured(s23, price_eur_blue_tomato, v629).

all_consistent(price_eur_blue_tomato) :- consistent(s23, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v629)).
query(true_val(price_eur_blue_tomato, unk_price_eur_blue_tomato)).

% @attr available_from_lib_tech
% @type categorical
% @canonical false
% @original_name Available from: Lib Tech direct
% @values yes=Yes unk_available_from_lib_tech=Unknown
% @importance 1.0

0.95::acc(s16, available_from_lib_tech).

0.92::true_val(available_from_lib_tech, yes); 0.08::true_val(available_from_lib_tech, unk_available_from_lib_tech).

measured(s16, available_from_lib_tech, yes).

all_consistent(available_from_lib_tech) :- consistent(s16, available_from_lib_tech).

evidence(all_consistent(available_from_lib_tech)).
query(true_val(available_from_lib_tech, yes)).
query(true_val(available_from_lib_tech, unk_available_from_lib_tech)).

% @attr available_from_evo
% @type categorical
% @canonical false
% @original_name Available from: evo.com
% @values yes=Yes unk_available_from_evo=Unknown
% @importance 0.85

0.85::acc(s19, available_from_evo).

0.72::true_val(available_from_evo, yes); 0.28::true_val(available_from_evo, unk_available_from_evo).

measured(s19, available_from_evo, yes).

all_consistent(available_from_evo) :- consistent(s19, available_from_evo).

evidence(all_consistent(available_from_evo)).
query(true_val(available_from_evo, yes)).
query(true_val(available_from_evo, unk_available_from_evo)).

% @attr available_from_rei
% @type categorical
% @canonical false
% @original_name Available from: REI Co-op
% @values yes=Yes unk_available_from_rei=Unknown
% @importance 0.70

0.85::acc(s24, available_from_rei).

0.72::true_val(available_from_rei, yes); 0.28::true_val(available_from_rei, unk_available_from_rei).

measured(s24, available_from_rei, yes).

all_consistent(available_from_rei) :- consistent(s24, available_from_rei).

evidence(all_consistent(available_from_rei)).
query(true_val(available_from_rei, yes)).
query(true_val(available_from_rei, unk_available_from_rei)).

% @attr available_from_backcountry
% @type categorical
% @canonical false
% @original_name Available from: Backcountry.com
% @values yes=Yes unk_available_from_backcountry=Unknown
% @importance 0.85

0.78::acc(s20c, available_from_backcountry).

0.56::true_val(available_from_backcountry, yes); 0.44::true_val(available_from_backcountry, unk_available_from_backcountry).

measured(s20c, available_from_backcountry, yes).

all_consistent(available_from_backcountry) :- consistent(s20c, available_from_backcountry).

evidence(all_consistent(available_from_backcountry)).
query(true_val(available_from_backcountry, yes)).
query(true_val(available_from_backcountry, unk_available_from_backcountry)).

% @attr available_from_salty_peaks
% @type categorical
% @canonical false
% @original_name Available from: Salty Peaks Snowboard Shop
% @values yes=Yes unk_available_from_salty_peaks=Unknown
% @importance 0.60

0.75::acc(s25, available_from_salty_peaks).

0.60::true_val(available_from_salty_peaks, yes); 0.40::true_val(available_from_salty_peaks, unk_available_from_salty_peaks).

measured(s25, available_from_salty_peaks, yes).

all_consistent(available_from_salty_peaks) :- consistent(s25, available_from_salty_peaks).

evidence(all_consistent(available_from_salty_peaks)).
query(true_val(available_from_salty_peaks, yes)).
query(true_val(available_from_salty_peaks, unk_available_from_salty_peaks)).

% @attr available_from_blauer
% @type categorical
% @canonical false
% @original_name Available from: Blauer Board Shop
% @values yes=Yes unk_available_from_blauer=Unknown
% @importance 0.60

0.72::acc(s26, available_from_blauer).

0.55::true_val(available_from_blauer, yes); 0.45::true_val(available_from_blauer, unk_available_from_blauer).

measured(s26, available_from_blauer, yes).

all_consistent(available_from_blauer) :- consistent(s26, available_from_blauer).

evidence(all_consistent(available_from_blauer)).
query(true_val(available_from_blauer, yes)).
query(true_val(available_from_blauer, unk_available_from_blauer)).

% @attr available_from_darkside
% @type categorical
% @canonical false
% @original_name Available from: Darkside Snowboards
% @values yes=Yes unk_available_from_darkside=Unknown
% @importance 0.50

0.68::acc(s27, available_from_darkside).

0.48::true_val(available_from_darkside, yes); 0.52::true_val(available_from_darkside, unk_available_from_darkside).

measured(s27, available_from_darkside, yes).

all_consistent(available_from_darkside) :- consistent(s27, available_from_darkside).

evidence(all_consistent(available_from_darkside)).
query(true_val(available_from_darkside, yes)).
query(true_val(available_from_darkside, unk_available_from_darkside)).

% @attr available_from_source_boards
% @type categorical
% @canonical false
% @original_name Available from: The Source Snowboard & Skate
% @values yes=Yes unk_available_from_source_boards=Unknown
% @importance 0.50

0.68::acc(s28, available_from_source_boards).

0.48::true_val(available_from_source_boards, yes); 0.52::true_val(available_from_source_boards, unk_available_from_source_boards).

measured(s28, available_from_source_boards, yes).

all_consistent(available_from_source_boards) :- consistent(s28, available_from_source_boards).

evidence(all_consistent(available_from_source_boards)).
query(true_val(available_from_source_boards, yes)).
query(true_val(available_from_source_boards, unk_available_from_source_boards)).

% @attr available_from_rudeboys
% @type categorical
% @canonical false
% @original_name Available from: Rudeboys
% @values yes=Yes unk_available_from_rudeboys=Unknown
% @importance 0.50

0.62::acc(s29, available_from_rudeboys).

0.41::true_val(available_from_rudeboys, yes); 0.59::true_val(available_from_rudeboys, unk_available_from_rudeboys).

measured(s29, available_from_rudeboys, yes).

all_consistent(available_from_rudeboys) :- consistent(s29, available_from_rudeboys).

evidence(all_consistent(available_from_rudeboys)).
query(true_val(available_from_rudeboys, yes)).
query(true_val(available_from_rudeboys, unk_available_from_rudeboys)).

% @attr available_from_one_boardshop
% @type categorical
% @canonical false
% @original_name Available from: ONE Boardshop (Canada)
% @values yes=Yes unk_available_from_one_boardshop=Unknown
% @importance 0.75

0.72::acc(s22b, available_from_one_boardshop).

0.59::true_val(available_from_one_boardshop, yes); 0.41::true_val(available_from_one_boardshop, unk_available_from_one_boardshop).

measured(s22b, available_from_one_boardshop, yes).

all_consistent(available_from_one_boardshop) :- consistent(s22b, available_from_one_boardshop).

evidence(all_consistent(available_from_one_boardshop)).
query(true_val(available_from_one_boardshop, yes)).
query(true_val(available_from_one_boardshop, unk_available_from_one_boardshop)).

% @attr available_from_melbourne
% @type categorical
% @canonical false
% @original_name Available from: Melbourne Snowboard Centre (Australia)
% @values yes=Yes unk_available_from_melbourne=Unknown
% @importance 0.60

0.68::acc(s30, available_from_melbourne).

0.51::true_val(available_from_melbourne, yes); 0.49::true_val(available_from_melbourne, unk_available_from_melbourne).

measured(s30, available_from_melbourne, yes).

all_consistent(available_from_melbourne) :- consistent(s30, available_from_melbourne).

evidence(all_consistent(available_from_melbourne)).
query(true_val(available_from_melbourne, yes)).
query(true_val(available_from_melbourne, unk_available_from_melbourne)).

% @attr available_from_attridge
% @type categorical
% @canonical false
% @original_name Available from: Attridge Ski & Board (Canada)
% @values yes=Yes unk_available_from_attridge=Unknown
% @importance 0.45

0.62::acc(s31, available_from_attridge).

0.41::true_val(available_from_attridge, yes); 0.59::true_val(available_from_attridge, unk_available_from_attridge).

measured(s31, available_from_attridge, yes).

all_consistent(available_from_attridge) :- consistent(s31, available_from_attridge).

evidence(all_consistent(available_from_attridge)).
query(true_val(available_from_attridge, yes)).
query(true_val(available_from_attridge, unk_available_from_attridge)).

% @attr available_from_amazon
% @type categorical
% @canonical false
% @original_name Available from: Amazon (older years)
% @values yes=Yes unk_available_from_amazon=Unknown
% @importance 0.50

0.65::acc(s32, available_from_amazon).

0.46::true_val(available_from_amazon, yes); 0.54::true_val(available_from_amazon, unk_available_from_amazon).

measured(s32, available_from_amazon, yes).

all_consistent(available_from_amazon) :- consistent(s32, available_from_amazon).

evidence(all_consistent(available_from_amazon)).
query(true_val(available_from_amazon, yes)).
query(true_val(available_from_amazon, unk_available_from_amazon)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.85

0.88::acc(s_m, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s_m, shape, tapered_directional).

all_consistent(shape) :-
    consistent(s_m, shape).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @canonical true
% @original_name taper
% @unit mm
% @values v9=9.0 unk_taper=Unknown
% @importance 0.85

0.85::acc(s33, taper).

0.76::true_val(taper, v9); 0.24::true_val(taper, unk_taper).

measured(s33, taper, v9).

all_consistent(taper) :- consistent(s33, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v9)).
query(true_val(taper, unk_taper)).

% @attr setback
% @type numeric
% @canonical true
% @original_name setback
% @unit mm
% @values v25=25.0 unk_setback=Unknown
% @importance 0.80

0.88::acc(s33b, setback).
0.82::acc(s34, setback).

0.95::true_val(setback, v25); 0.05::true_val(setback, unk_setback).

measured(s33b, setback, v25).
measured(s34, setback, v25).

all_consistent(setback) :-
    consistent(s33b, setback),
    consistent(s34, setback).

evidence(all_consistent(setback)).
query(true_val(setback, v25)).
query(true_val(setback, unk_setback)).

% @attr setback_max_back
% @type categorical
% @canonical false
% @original_name setback (max back position)
% @values neg_2_25in_at_22_75=Negative_2pt25_inches_at_22pt75in_stance unk_setback_max_back=Unknown
% @importance 0.85

0.82::acc(s35, setback_max_back).

0.69::true_val(setback_max_back, neg_2_25in_at_22_75); 0.31::true_val(setback_max_back, unk_setback_max_back).

measured(s35, setback_max_back, neg_2_25in_at_22_75).

all_consistent(setback_max_back) :- consistent(s35, setback_max_back).

evidence(all_consistent(setback_max_back)).
query(true_val(setback_max_back, neg_2_25in_at_22_75)).
query(true_val(setback_max_back, unk_setback_max_back)).

% @attr volume_shifted
% @type categorical
% @canonical false
% @original_name Volume shifted
% @values yes_ride_1_3cm_shorter=Yes_ride_1_to_3cm_shorter unk_volume_shifted=Unknown
% @importance 0.93

0.93::acc(s16, volume_shifted).
0.88::acc(s_m, volume_shifted).

0.96::true_val(volume_shifted, yes_ride_1_3cm_shorter); 0.04::true_val(volume_shifted, unk_volume_shifted).

measured(s16, volume_shifted, yes_ride_1_3cm_shorter).
measured(s_m, volume_shifted, yes_ride_1_3cm_shorter).

all_consistent(volume_shifted) :-
    consistent(s16, volume_shifted),
    (indep(s_m), consistent(s_m, volume_shifted) ; \+indep(s_m)).

evidence(all_consistent(volume_shifted)).
query(true_val(volume_shifted, yes_ride_1_3cm_shorter)).
query(true_val(volume_shifted, unk_volume_shifted)).

% @attr width_options
% @type categorical
% @canonical false
% @original_name width_options
% @values standard_mid_wide=Standard_but_rides_mid_wide_to_wide unk_width_options=Unknown
% @importance 0.85

0.85::acc(s_m, width_options).

0.95::true_val(width_options, standard_mid_wide); 0.05::true_val(width_options, unk_width_options).

measured(s_m, width_options, standard_mid_wide).

all_consistent(width_options) :- consistent(s_m, width_options).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_mid_wide)).
query(true_val(width_options, unk_width_options)).

% @attr width_note
% @type categorical
% @canonical false
% @original_name Width note
% @values size_10_plus_us_boot=Suited_for_size_10_plus_US_boot unk_width_note=Unknown
% @importance 0.80

0.82::acc(s36, width_note).

0.68::true_val(width_note, size_10_plus_us_boot); 0.32::true_val(width_note, unk_width_note).

measured(s36, width_note, size_10_plus_us_boot).

all_consistent(width_note) :- consistent(s36, width_note).

evidence(all_consistent(width_note)).
query(true_val(width_note, size_10_plus_us_boot)).
query(true_val(width_note, unk_width_note)).

% @attr nose_design
% @type categorical
% @canonical false
% @original_name Nose design
% @values long_floaty_orca_nose=Long_floaty_Orca_nose unk_nose_design=Unknown
% @importance 1.0

0.93::acc(s16, nose_design).

0.92::true_val(nose_design, long_floaty_orca_nose); 0.08::true_val(nose_design, unk_nose_design).

measured(s16, nose_design, long_floaty_orca_nose).

all_consistent(nose_design) :- consistent(s16, nose_design).

evidence(all_consistent(nose_design)).
query(true_val(nose_design, long_floaty_orca_nose)).
query(true_val(nose_design, unk_nose_design)).

% @attr tail_design
% @type categorical
% @canonical false
% @original_name Tail design
% @values power_kink_tail=Power_Kink_Tail_switch_friendly unk_tail_design=Unknown
% @importance 1.0

0.93::acc(s16, tail_design).

0.92::true_val(tail_design, power_kink_tail); 0.08::true_val(tail_design, unk_tail_design).

measured(s16, tail_design, power_kink_tail).

all_consistent(tail_design) :- consistent(s16, tail_design).

evidence(all_consistent(tail_design)).
query(true_val(tail_design, power_kink_tail)).
query(true_val(tail_design, unk_tail_design)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values c2x_directional=C2X_Directional unk_camber_type=Unknown
% @importance 0.93

0.95::acc(s16, camber_type).
0.88::acc(s_m, camber_type).

0.97::true_val(camber_type, c2x_directional); 0.03::true_val(camber_type, unk_camber_type).

measured(s16, camber_type, c2x_directional).
measured(s_m, camber_type, c2x_directional).

all_consistent(camber_type) :-
    consistent(s16, camber_type),
    (indep(s_m), consistent(s_m, camber_type) ; \+indep(s_m)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, c2x_directional)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical true
% @original_name camber_description
% @values shortened_rocker_lengthened_camber=Shortened_rocker_between_feet_lengthened_directional_camber unk_camber_description=Unknown
% @importance 0.85

0.85::acc(s_m, camber_description).

0.95::true_val(camber_description, shortened_rocker_lengthened_camber); 0.05::true_val(camber_description, unk_camber_description).

measured(s_m, camber_description, shortened_rocker_lengthened_camber).

all_consistent(camber_description) :- consistent(s_m, camber_description).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, shortened_rocker_lengthened_camber)).
query(true_val(camber_description, unk_camber_description)).

% @attr camber_description_asymmetric
% @type categorical
% @canonical false
% @original_name camber_description (asymmetric detail)
% @values front_longer_elliptical_back_shorter_aggressive=Front_camber_longer_elliptical_back_shorter_aggressive unk_camber_description_asymmetric=Unknown
% @importance 0.90

0.85::acc(s37, camber_description_asymmetric).

0.69::true_val(camber_description_asymmetric, front_longer_elliptical_back_shorter_aggressive); 0.31::true_val(camber_description_asymmetric, unk_camber_description_asymmetric).

measured(s37, camber_description_asymmetric, front_longer_elliptical_back_shorter_aggressive).

all_consistent(camber_description_asymmetric) :- consistent(s37, camber_description_asymmetric).

evidence(all_consistent(camber_description_asymmetric)).
query(true_val(camber_description_asymmetric, front_longer_elliptical_back_shorter_aggressive)).
query(true_val(camber_description_asymmetric, unk_camber_description_asymmetric)).

% @attr camber_description_c2x_detail
% @type categorical
% @canonical false
% @original_name camber_description (C2X evo description)
% @values shorter_aggressive_banana_cambers_underfoot=Shorter_aggressive_banana_rocker_cambers_underfoot unk_camber_description_c2x_detail=Unknown
% @importance 0.80

0.82::acc(s38, camber_description_c2x_detail).

0.70::true_val(camber_description_c2x_detail, shorter_aggressive_banana_cambers_underfoot); 0.30::true_val(camber_description_c2x_detail, unk_camber_description_c2x_detail).

measured(s38, camber_description_c2x_detail, shorter_aggressive_banana_cambers_underfoot).

all_consistent(camber_description_c2x_detail) :-
    (indep(s38), consistent(s38, camber_description_c2x_detail) ; \+indep(s38)).

evidence(all_consistent(camber_description_c2x_detail)).
query(true_val(camber_description_c2x_detail, shorter_aggressive_banana_cambers_underfoot)).
query(true_val(camber_description_c2x_detail, unk_camber_description_c2x_detail)).

% @attr camber_description_unweighted
% @type categorical
% @canonical false
% @original_name camber_description (unweighted behavior)
% @values neither_camber_touches_snow=Neither_camber_touches_snow_when_unweighted unk_camber_description_unweighted=Unknown
% @importance 0.85

0.82::acc(s35, camber_description_unweighted).

0.69::true_val(camber_description_unweighted, neither_camber_touches_snow); 0.31::true_val(camber_description_unweighted, unk_camber_description_unweighted).

measured(s35, camber_description_unweighted, neither_camber_touches_snow).

all_consistent(camber_description_unweighted) :- consistent(s35, camber_description_unweighted).

evidence(all_consistent(camber_description_unweighted)).
query(true_val(camber_description_unweighted, neither_camber_touches_snow)).
query(true_val(camber_description_unweighted, unk_camber_description_unweighted)).

% @attr camber_description_flat_base
% @type categorical
% @canonical false
% @original_name camber_description (flat base behavior)
% @values loose_auto_spinny_forgiving=Loose_and_auto_spinny_when_flat_basing_forgiving unk_camber_description_flat_base=Unknown
% @importance 0.85

0.82::acc(s35b, camber_description_flat_base).

0.69::true_val(camber_description_flat_base, loose_auto_spinny_forgiving); 0.31::true_val(camber_description_flat_base, unk_camber_description_flat_base).

measured(s35b, camber_description_flat_base, loose_auto_spinny_forgiving).

all_consistent(camber_description_flat_base) :- consistent(s35b, camber_description_flat_base).

evidence(all_consistent(camber_description_flat_base)).
query(true_val(camber_description_flat_base, loose_auto_spinny_forgiving)).
query(true_val(camber_description_flat_base, unk_camber_description_flat_base)).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical false
% @original_name flex_rating_10 (manufacturer per size)
% @values flex_7_to_8_per_size=Flex_7_150_161_Flex_8_153_159_164 unk_flex_rating_10_manufacturer=Unknown
% @importance 1.0

0.93::acc(s16, flex_rating_10_manufacturer).

0.92::true_val(flex_rating_10_manufacturer, flex_7_to_8_per_size); 0.08::true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer).

measured(s16, flex_rating_10_manufacturer, flex_7_to_8_per_size).

all_consistent(flex_rating_10_manufacturer) :- consistent(s16, flex_rating_10_manufacturer).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, flex_7_to_8_per_size)).
query(true_val(flex_rating_10_manufacturer, unk_flex_rating_10_manufacturer)).

% @attr flex_rating_10
% @type numeric
% @canonical true
% @original_name flex_rating_10
% @unit /10
% @values v6=6.0 v7=7.0 v8=8.0
% @importance 0.83

0.72::acc(s_m, flex_rating_10).
0.82::acc(s39, flex_rating_10).
0.70::acc(s40, flex_rating_10).
0.72::acc(s41, flex_rating_10).

0.15::true_val(flex_rating_10, v6); 0.30::true_val(flex_rating_10, v7); 0.55::true_val(flex_rating_10, v8).

measured(s_m, flex_rating_10, v6).
measured(s39, flex_rating_10, v7).
measured(s40, flex_rating_10, v8).
measured(s41, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    consistent(s39, flex_rating_10),
    consistent(s40, flex_rating_10),
    consistent(s41, flex_rating_10),
    (indep(s_m), consistent(s_m, flex_rating_10) ; \+indep(s_m)).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6)).
query(true_val(flex_rating_10, v7)).
query(true_val(flex_rating_10, v8)).

% @attr flex_rating_10_evo
% @type categorical
% @canonical false
% @original_name flex_rating_10 (evo classification)
% @values stiff=Stiff unk_flex_rating_10_evo=Unknown
% @importance 0.75

0.78::acc(s42, flex_rating_10_evo).

0.64::true_val(flex_rating_10_evo, stiff); 0.36::true_val(flex_rating_10_evo, unk_flex_rating_10_evo).

measured(s42, flex_rating_10_evo, stiff).

all_consistent(flex_rating_10_evo) :-
    (indep(s38), consistent(s42, flex_rating_10_evo) ; \+indep(s38)).

evidence(all_consistent(flex_rating_10_evo)).
query(true_val(flex_rating_10_evo, stiff)).
query(true_val(flex_rating_10_evo, unk_flex_rating_10_evo)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values mid_flex=Mid_flex_balanced medium_firm=Medium_Firm medium_stiff=Medium_stiff_confident_high_speed
% @importance 0.78

0.75::acc(s_m, flex_feel).
0.70::acc(s43, flex_feel).
0.78::acc(s44, flex_feel).

0.25::true_val(flex_feel, mid_flex); 0.35::true_val(flex_feel, medium_firm); 0.40::true_val(flex_feel, medium_stiff).

measured(s_m, flex_feel, mid_flex).
measured(s43, flex_feel, medium_firm).
measured(s44, flex_feel, medium_stiff).

all_consistent(flex_feel) :-
    consistent(s44, flex_feel),
    (indep(s_m), consistent(s_m, flex_feel) ; \+indep(s_m)),
    (indep(s43), consistent(s43, flex_feel) ; \+indep(s43)).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, mid_flex)).
query(true_val(flex_feel, medium_firm)).
query(true_val(flex_feel, medium_stiff)).

% @attr flex_feel_distribution
% @type categorical
% @canonical false
% @original_name flex_feel (distribution detail)
% @values stiff_nose_tail_more_give_middle=Stiff_nose_and_tail_more_give_in_middle_than_Orca_II unk_flex_feel_distribution=Unknown
% @importance 0.90

0.85::acc(s37, flex_feel_distribution).

0.69::true_val(flex_feel_distribution, stiff_nose_tail_more_give_middle); 0.31::true_val(flex_feel_distribution, unk_flex_feel_distribution).

measured(s37, flex_feel_distribution, stiff_nose_tail_more_give_middle).

all_consistent(flex_feel_distribution) :- consistent(s37, flex_feel_distribution).

evidence(all_consistent(flex_feel_distribution)).
query(true_val(flex_feel_distribution, stiff_nose_tail_more_give_middle)).
query(true_val(flex_feel_distribution, unk_flex_feel_distribution)).

% @attr construction_type
% @type categorical
% @canonical false
% @original_name Construction
% @values firepower_fp=Firepower_Construction_FP unk_construction_type=Unknown
% @importance 0.93

0.95::acc(s16, construction_type).
0.88::acc(s_m, construction_type).

0.97::true_val(construction_type, firepower_fp); 0.03::true_val(construction_type, unk_construction_type).

measured(s16, construction_type, firepower_fp).
measured(s_m, construction_type, firepower_fp).

all_consistent(construction_type) :-
    consistent(s16, construction_type),
    (indep(s_m), consistent(s_m, construction_type) ; \+indep(s_m)).

evidence(all_consistent(construction_type)).
query(true_val(construction_type, firepower_fp)).
query(true_val(construction_type, unk_construction_type)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values hemlock_paulownia=60pct_Makah_Hemlock_40pct_Paulownia aspen_paulownia=60pct_Aspen_40pct_Paulownia
% @importance 0.90

0.95::acc(s16, core_material).
0.60::acc(s_m, core_material).
0.55::acc(s45, core_material).

0.70::true_val(core_material, hemlock_paulownia); 0.30::true_val(core_material, aspen_paulownia).

measured(s16, core_material, hemlock_paulownia).
measured(s_m, core_material, aspen_paulownia).
measured(s45, core_material, aspen_paulownia).

all_consistent(core_material) :-
    consistent(s16, core_material),
    (indep(s_m), consistent(s_m, core_material) ; \+indep(s_m)),
    (indep(s45), consistent(s45, core_material) ; \+indep(s45)).

evidence(all_consistent(core_material)).
query(true_val(core_material, hemlock_paulownia)).
query(true_val(core_material, aspen_paulownia)).

% @attr sustainability_certification_hemlock
% @type categorical
% @canonical false
% @original_name sustainability_certification (Hemlock sourcing)
% @values makah_hemlock_sustainable=Makah_Hemlock_sustainably_harvested_self_regenerating unk_sustainability_certification_hemlock=Unknown
% @importance 0.60

0.85::acc(s46, sustainability_certification_hemlock).

0.75::true_val(sustainability_certification_hemlock, makah_hemlock_sustainable); 0.25::true_val(sustainability_certification_hemlock, unk_sustainability_certification_hemlock).

measured(s46, sustainability_certification_hemlock, makah_hemlock_sustainable).

all_consistent(sustainability_certification_hemlock) :- consistent(s46, sustainability_certification_hemlock).

evidence(all_consistent(sustainability_certification_hemlock)).
query(true_val(sustainability_certification_hemlock, makah_hemlock_sustainable)).
query(true_val(sustainability_certification_hemlock, unk_sustainability_certification_hemlock)).

% @attr topsheet
% @type categorical
% @canonical true
% @original_name topsheet
% @values ocean_bound_pbt=Ocean_bound_PBT_recycled_PET eco_sublimated_poly=Eco_Sublimated_Poly_Topsheet
% @importance 0.93

0.93::acc(s16, topsheet).
0.65::acc(s_m, topsheet).

0.75::true_val(topsheet, ocean_bound_pbt); 0.25::true_val(topsheet, eco_sublimated_poly).

measured(s16, topsheet, ocean_bound_pbt).
measured(s_m, topsheet, eco_sublimated_poly).

all_consistent(topsheet) :-
    consistent(s16, topsheet),
    (indep(s_m), consistent(s_m, topsheet) ; \+indep(s_m)).

evidence(all_consistent(topsheet)).
query(true_val(topsheet, ocean_bound_pbt)).
query(true_val(topsheet, eco_sublimated_poly)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values triax_biax_basalt_carbon_x=Tri_Ax_Bi_Ax_Fiber_Basalt_Alloy_Carbon_X unk_laminate=Unknown
% @importance 0.85

0.85::acc(s_m, laminate).

0.95::true_val(laminate, triax_biax_basalt_carbon_x); 0.05::true_val(laminate, unk_laminate).

measured(s_m, laminate, triax_biax_basalt_carbon_x).

all_consistent(laminate) :- consistent(s_m, laminate).

evidence(all_consistent(laminate)).
query(true_val(laminate, triax_biax_basalt_carbon_x)).
query(true_val(laminate, unk_laminate)).

% @attr laminate_properties
% @type categorical
% @canonical false
% @original_name laminate (properties)
% @values lightweight_strong_damped=Lightweight_strong_damped_ride unk_laminate_properties=Unknown
% @importance 0.85

0.82::acc(s_m, laminate_properties).

0.95::true_val(laminate_properties, lightweight_strong_damped); 0.05::true_val(laminate_properties, unk_laminate_properties).

measured(s_m, laminate_properties, lightweight_strong_damped).

all_consistent(laminate_properties) :- consistent(s_m, laminate_properties).

evidence(all_consistent(laminate_properties)).
query(true_val(laminate_properties, lightweight_strong_damped)).
query(true_val(laminate_properties, unk_laminate_properties)).

% @attr laminate_carbon_layout
% @type categorical
% @canonical false
% @original_name laminate (carbon layout)
% @values carbon_30deg_torsional=Carbon_fiber_30deg_for_torsional_response unk_laminate_carbon_layout=Unknown
% @importance 0.85

0.82::acc(s_m, laminate_carbon_layout).

0.95::true_val(laminate_carbon_layout, carbon_30deg_torsional); 0.05::true_val(laminate_carbon_layout, unk_laminate_carbon_layout).

measured(s_m, laminate_carbon_layout, carbon_30deg_torsional).

all_consistent(laminate_carbon_layout) :- consistent(s_m, laminate_carbon_layout).

evidence(all_consistent(laminate_carbon_layout)).
query(true_val(laminate_carbon_layout, carbon_30deg_torsional)).
query(true_val(laminate_carbon_layout, unk_laminate_carbon_layout)).

% @attr laminate_fiberglass_basalt
% @type categorical
% @canonical false
% @original_name laminate (fiberglass basalt detail)
% @values triax_fiberglass_basalt_web=Tri_ax_fiberglass_basalt_web_vibration_damping unk_laminate_fiberglass_basalt=Unknown
% @importance 0.60

0.78::acc(s47, laminate_fiberglass_basalt).

0.64::true_val(laminate_fiberglass_basalt, triax_fiberglass_basalt_web); 0.36::true_val(laminate_fiberglass_basalt, unk_laminate_fiberglass_basalt).

measured(s47, laminate_fiberglass_basalt, triax_fiberglass_basalt_web).

all_consistent(laminate_fiberglass_basalt) :- consistent(s47, laminate_fiberglass_basalt).

evidence(all_consistent(laminate_fiberglass_basalt)).
query(true_val(laminate_fiberglass_basalt, triax_fiberglass_basalt_web)).
query(true_val(laminate_fiberglass_basalt, unk_laminate_fiberglass_basalt)).

% @attr base_material
% @type categorical
% @canonical false
% @original_name base_material
% @values sintered_knife_cut=Sintered_Knife_Cut_Base unk_base_material=Unknown
% @importance 0.85

0.85::acc(s_m, base_material).

0.95::true_val(base_material, sintered_knife_cut); 0.05::true_val(base_material, unk_base_material).

measured(s_m, base_material, sintered_knife_cut).

all_consistent(base_material) :- consistent(s_m, base_material).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_knife_cut)).
query(true_val(base_material, unk_base_material)).

% @attr base_type
% @type categorical
% @canonical true
% @original_name base_type
% @values fast_sintered_die_cut=Fast_sintered_die_cut_reduce_waste unk_base_type=Unknown
% @importance 0.85

0.85::acc(s_m, base_type).

0.95::true_val(base_type, fast_sintered_die_cut); 0.05::true_val(base_type, unk_base_type).

measured(s_m, base_type, fast_sintered_die_cut).

all_consistent(base_type) :- consistent(s_m, base_type).

evidence(all_consistent(base_type)).
query(true_val(base_type, fast_sintered_die_cut)).
query(true_val(base_type, unk_base_type)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values not_super_fast_decent_waxed=Not_super_fast_decent_glide_when_waxed_needs_frequent_waxing unk_base_glide_performance=Unknown
% @importance 0.80

0.85::acc(s48, base_glide_performance).

0.68::true_val(base_glide_performance, not_super_fast_decent_waxed); 0.32::true_val(base_glide_performance, unk_base_glide_performance).

measured(s48, base_glide_performance, not_super_fast_decent_waxed).

all_consistent(base_glide_performance) :- consistent(s48, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, not_super_fast_decent_waxed)).
query(true_val(base_glide_performance, unk_base_glide_performance)).

% @attr sidewall_material
% @type categorical
% @canonical true
% @original_name sidewall_material
% @values birch_internal_uhmw_sintered=Birch_Internal_UHMW_Sintered_Sidewall unk_sidewall_material=Unknown
% @importance 0.85

0.85::acc(s_m, sidewall_material).

0.95::true_val(sidewall_material, birch_internal_uhmw_sintered); 0.05::true_val(sidewall_material, unk_sidewall_material).

measured(s_m, sidewall_material, birch_internal_uhmw_sintered).

all_consistent(sidewall_material) :- consistent(s_m, sidewall_material).

evidence(all_consistent(sidewall_material)).
query(true_val(sidewall_material, birch_internal_uhmw_sintered)).
query(true_val(sidewall_material, unk_sidewall_material)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values magne_traction_7=Magne_Traction_7_serrations unk_edge_technology=Unknown
% @importance 0.85

0.88::acc(s_m, edge_technology).

0.95::true_val(edge_technology, magne_traction_7); 0.05::true_val(edge_technology, unk_edge_technology).

measured(s_m, edge_technology, magne_traction_7).

all_consistent(edge_technology) :- consistent(s_m, edge_technology).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, magne_traction_7)).
query(true_val(edge_technology, unk_edge_technology)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values uhmw_tip_tail_impact=UHMW_Tip_Tail_Impact_Deflection_reduces_swing_weight unk_construction_material_innovation=Unknown
% @importance 0.85

0.85::acc(s_m, construction_material_innovation).

0.95::true_val(construction_material_innovation, uhmw_tip_tail_impact); 0.05::true_val(construction_material_innovation, unk_construction_material_innovation).

measured(s_m, construction_material_innovation, uhmw_tip_tail_impact).

all_consistent(construction_material_innovation) :- consistent(s_m, construction_material_innovation).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, uhmw_tip_tail_impact)).
query(true_val(construction_material_innovation, unk_construction_material_innovation)).

% @attr construction_material_innovation_spin_slim
% @type categorical
% @canonical false
% @original_name construction_material_innovation (Spin Slim)
% @values lightweight_spin_slim=Lightweight_Spin_Slim_tapered_tip_tail unk_construction_material_innovation_spin_slim=Unknown
% @importance 0.85

0.85::acc(s_m, construction_material_innovation_spin_slim).

0.95::true_val(construction_material_innovation_spin_slim, lightweight_spin_slim); 0.05::true_val(construction_material_innovation_spin_slim, unk_construction_material_innovation_spin_slim).

measured(s_m, construction_material_innovation_spin_slim, lightweight_spin_slim).

all_consistent(construction_material_innovation_spin_slim) :- consistent(s_m, construction_material_innovation_spin_slim).

evidence(all_consistent(construction_material_innovation_spin_slim)).
query(true_val(construction_material_innovation_spin_slim, lightweight_spin_slim)).
query(true_val(construction_material_innovation_spin_slim, unk_construction_material_innovation_spin_slim)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values inserts_2x4=2x4_Inserts unk_mounting_pattern=Unknown
% @importance 0.85

0.88::acc(s_m, mounting_pattern).

0.95::true_val(mounting_pattern, inserts_2x4); 0.05::true_val(mounting_pattern, unk_mounting_pattern).

measured(s_m, mounting_pattern, inserts_2x4).

all_consistent(mounting_pattern) :- consistent(s_m, mounting_pattern).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, inserts_2x4)).
query(true_val(mounting_pattern, unk_mounting_pattern)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values seven_sizes_150_to_164=150_153_155_157_159_161_164cm unk_available_sizes=Unknown
% @importance 0.85

0.90::acc(s_m, available_sizes).

0.95::true_val(available_sizes, seven_sizes_150_to_164); 0.05::true_val(available_sizes, unk_available_sizes).

measured(s_m, available_sizes, seven_sizes_150_to_164).

all_consistent(available_sizes) :- consistent(s_m, available_sizes).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, seven_sizes_150_to_164)).
query(true_val(available_sizes, unk_available_sizes)).

% @attr specs_150cm
% @type categorical
% @canonical false
% @original_name 150cm specs
% @values confirmed_150=Contact_107_SC_7pt5_NT_30pt5_29pt6_W_26pt0_Flex_7 unk_specs_150cm=Unknown
% @importance 1.0

0.95::acc(s16, specs_150cm).

0.92::true_val(specs_150cm, confirmed_150); 0.08::true_val(specs_150cm, unk_specs_150cm).

measured(s16, specs_150cm, confirmed_150).

all_consistent(specs_150cm) :- consistent(s16, specs_150cm).

evidence(all_consistent(specs_150cm)).
query(true_val(specs_150cm, confirmed_150)).
query(true_val(specs_150cm, unk_specs_150cm)).

% @attr specs_153cm
% @type categorical
% @canonical false
% @original_name 153cm specs
% @values confirmed_153=Contact_110_SC_8pt0_NT_30pt7_29pt8_W_26pt3_Flex_8 unk_specs_153cm=Unknown
% @importance 1.0

0.95::acc(s16, specs_153cm).

0.92::true_val(specs_153cm, confirmed_153); 0.08::true_val(specs_153cm, unk_specs_153cm).

measured(s16, specs_153cm, confirmed_153).

all_consistent(specs_153cm) :- consistent(s16, specs_153cm).

evidence(all_consistent(specs_153cm)).
query(true_val(specs_153cm, confirmed_153)).
query(true_val(specs_153cm, unk_specs_153cm)).

% @attr specs_155cm
% @type categorical
% @canonical false
% @original_name 155cm specs
% @values confirmed_155=Contact_112_SC_8pt0_NT_30pt8_29pt9_W_26pt4_Flex_8 unk_specs_155cm=Unknown
% @importance 1.0

0.95::acc(s16, specs_155cm).

0.92::true_val(specs_155cm, confirmed_155); 0.08::true_val(specs_155cm, unk_specs_155cm).

measured(s16, specs_155cm, confirmed_155).

all_consistent(specs_155cm) :- consistent(s16, specs_155cm).

evidence(all_consistent(specs_155cm)).
query(true_val(specs_155cm, confirmed_155)).
query(true_val(specs_155cm, unk_specs_155cm)).

% @attr specs_157cm
% @type categorical
% @canonical false
% @original_name 157cm specs
% @values confirmed_157=Contact_113_SC_8pt0_NT_30pt9_30pt0_W_26pt5_Flex_8 unk_specs_157cm=Unknown
% @importance 1.0

0.95::acc(s16, specs_157cm).

0.92::true_val(specs_157cm, confirmed_157); 0.08::true_val(specs_157cm, unk_specs_157cm).

measured(s16, specs_157cm, confirmed_157).

all_consistent(specs_157cm) :- consistent(s16, specs_157cm).

evidence(all_consistent(specs_157cm)).
query(true_val(specs_157cm, confirmed_157)).
query(true_val(specs_157cm, unk_specs_157cm)).

% @attr specs_159cm
% @type categorical
% @canonical false
% @original_name 159cm specs
% @values confirmed_159=Contact_114_SC_8pt0_NT_31pt0_30pt1_W_26pt6_Flex_8 unk_specs_159cm=Unknown
% @importance 1.0

0.95::acc(s16, specs_159cm).

0.92::true_val(specs_159cm, confirmed_159); 0.08::true_val(specs_159cm, unk_specs_159cm).

measured(s16, specs_159cm, confirmed_159).

all_consistent(specs_159cm) :- consistent(s16, specs_159cm).

evidence(all_consistent(specs_159cm)).
query(true_val(specs_159cm, confirmed_159)).
query(true_val(specs_159cm, unk_specs_159cm)).

% @attr specs_161cm
% @type categorical
% @canonical false
% @original_name 161cm specs
% @values confirmed_161=Contact_115_SC_8pt0_NT_31pt1_30pt2_W_26pt7_Flex_7 unk_specs_161cm=Unknown
% @importance 1.0

0.95::acc(s16, specs_161cm).

0.92::true_val(specs_161cm, confirmed_161); 0.08::true_val(specs_161cm, unk_specs_161cm).

measured(s16, specs_161cm, confirmed_161).

all_consistent(specs_161cm) :- consistent(s16, specs_161cm).

evidence(all_consistent(specs_161cm)).
query(true_val(specs_161cm, confirmed_161)).
query(true_val(specs_161cm, unk_specs_161cm)).

% @attr specs_164cm
% @type categorical
% @canonical false
% @original_name 164cm specs
% @values confirmed_164=Contact_116_SC_8pt0_NT_31pt2_30pt3_W_26pt8_Flex_8 unk_specs_164cm=Unknown
% @importance 1.0

0.95::acc(s16, specs_164cm).

0.92::true_val(specs_164cm, confirmed_164); 0.08::true_val(specs_164cm, unk_specs_164cm).

measured(s16, specs_164cm, confirmed_164).

all_consistent(specs_164cm) :- consistent(s16, specs_164cm).

evidence(all_consistent(specs_164cm)).
query(true_val(specs_164cm, confirmed_164)).
query(true_val(specs_164cm, unk_specs_164cm)).

% @attr tip_tail_width_size_161
% @type numeric
% @canonical false
% @original_name tip_tail_width_size (161cm nose)
% @unit cm
% @values v31_1=31.1 v31_3=31.3
% @importance 0.93

0.93::acc(s16, tip_tail_width_size_161).
0.70::acc(s_m, tip_tail_width_size_161).

0.65::true_val(tip_tail_width_size_161, v31_1); 0.35::true_val(tip_tail_width_size_161, v31_3).

measured(s16, tip_tail_width_size_161, v31_1).
measured(s_m, tip_tail_width_size_161, v31_3).

all_consistent(tip_tail_width_size_161) :-
    consistent(s16, tip_tail_width_size_161),
    (indep(s_m), consistent(s_m, tip_tail_width_size_161) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size_161)).
query(true_val(tip_tail_width_size_161, v31_1)).
query(true_val(tip_tail_width_size_161, v31_3)).

% @attr tip_tail_width_size
% @type numeric
% @canonical true
% @original_name tip_tail_width_size
% @unit cm
% @values v30_1=30.1 v30_2=30.2
% @importance 0.93

0.93::acc(s16, tip_tail_width_size).
0.70::acc(s_m, tip_tail_width_size).

0.65::true_val(tip_tail_width_size, v30_1); 0.35::true_val(tip_tail_width_size, v30_2).

measured(s16, tip_tail_width_size, v30_1).
measured(s_m, tip_tail_width_size, v30_2).

all_consistent(tip_tail_width_size) :-
    consistent(s16, tip_tail_width_size),
    (indep(s_m), consistent(s_m, tip_tail_width_size) ; \+indep(s_m)).

evidence(all_consistent(tip_tail_width_size)).
query(true_val(tip_tail_width_size, v30_1)).
query(true_val(tip_tail_width_size, v30_2)).

% @attr recommended_weight_range_size_150
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (150cm)
% @values v130_lbs_60_kg=130_plus_lbs_60_plus_kg unk_recommended_weight_range_size_150=Unknown
% @importance 0.93

0.93::acc(s16, recommended_weight_range_size_150).
0.85::acc(s_m, recommended_weight_range_size_150).

0.97::true_val(recommended_weight_range_size_150, v130_lbs_60_kg); 0.03::true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150).

measured(s16, recommended_weight_range_size_150, v130_lbs_60_kg).
measured(s_m, recommended_weight_range_size_150, v130_lbs_60_kg).

all_consistent(recommended_weight_range_size_150) :-
    consistent(s16, recommended_weight_range_size_150),
    (indep(s_m), consistent(s_m, recommended_weight_range_size_150) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_150)).
query(true_val(recommended_weight_range_size_150, v130_lbs_60_kg)).
query(true_val(recommended_weight_range_size_150, unk_recommended_weight_range_size_150)).

% @attr recommended_weight_range_size
% @type categorical
% @canonical true
% @original_name recommended_weight_range_size
% @values v140_lbs_65_kg=140_plus_lbs_65_plus_kg v70_kg=70_plus_kg
% @importance 0.93

0.93::acc(s16, recommended_weight_range_size).
0.80::acc(s_m, recommended_weight_range_size).

0.60::true_val(recommended_weight_range_size, v140_lbs_65_kg); 0.40::true_val(recommended_weight_range_size, v70_kg).

measured(s16, recommended_weight_range_size, v140_lbs_65_kg).
measured(s_m, recommended_weight_range_size, v70_kg).

all_consistent(recommended_weight_range_size) :-
    consistent(s16, recommended_weight_range_size),
    (indep(s_m), consistent(s_m, recommended_weight_range_size) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size)).
query(true_val(recommended_weight_range_size, v140_lbs_65_kg)).
query(true_val(recommended_weight_range_size, v70_kg)).

% @attr recommended_weight_range_size_159
% @type categorical
% @canonical false
% @original_name recommended_weight_range_size (159cm)
% @values v155_lbs_75_kg=155_plus_lbs_75_plus_kg v80_kg=80_plus_kg
% @importance 0.93

0.93::acc(s16, recommended_weight_range_size_159).
0.80::acc(s_m, recommended_weight_range_size_159).

0.60::true_val(recommended_weight_range_size_159, v155_lbs_75_kg); 0.40::true_val(recommended_weight_range_size_159, v80_kg).

measured(s16, recommended_weight_range_size_159, v155_lbs_75_kg).
measured(s_m, recommended_weight_range_size_159, v80_kg).

all_consistent(recommended_weight_range_size_159) :-
    consistent(s16, recommended_weight_range_size_159),
    (indep(s_m), consistent(s_m, recommended_weight_range_size_159) ; \+indep(s_m)).

evidence(all_consistent(recommended_weight_range_size_159)).
query(true_val(recommended_weight_range_size_159, v155_lbs_75_kg)).
query(true_val(recommended_weight_range_size_159, v80_kg)).

% @attr stance_width_range_size
% @type categorical
% @canonical false
% @original_name stance_width_range_size
% @values v17_5_to_22_5=17pt5_to_22pt5_inches unk_stance_width_range_size=Unknown
% @importance 0.93

0.93::acc(s16, stance_width_range_size).
0.88::acc(s_m, stance_width_range_size).

0.97::true_val(stance_width_range_size, v17_5_to_22_5); 0.03::true_val(stance_width_range_size, unk_stance_width_range_size).

measured(s16, stance_width_range_size, v17_5_to_22_5).
measured(s_m, stance_width_range_size, v17_5_to_22_5).

all_consistent(stance_width_range_size) :-
    consistent(s16, stance_width_range_size),
    (indep(s_m), consistent(s_m, stance_width_range_size) ; \+indep(s_m)).

evidence(all_consistent(stance_width_range_size)).
query(true_val(stance_width_range_size, v17_5_to_22_5)).
query(true_val(stance_width_range_size, unk_stance_width_range_size)).

% @attr ride_characteristics
% @type categorical
% @canonical false
% @original_name Ride characteristics
% @values aggressive_poppy_fast_good_edge=Aggressive_poppy_fast_good_edge_hold unk_ride_characteristics=Unknown
% @importance 0.80

0.85::acc(s48, ride_characteristics).

0.68::true_val(ride_characteristics, aggressive_poppy_fast_good_edge); 0.32::true_val(ride_characteristics, unk_ride_characteristics).

measured(s48, ride_characteristics, aggressive_poppy_fast_good_edge).

all_consistent(ride_characteristics) :- consistent(s48, ride_characteristics).

evidence(all_consistent(ride_characteristics)).
query(true_val(ride_characteristics, aggressive_poppy_fast_good_edge)).
query(true_val(ride_characteristics, unk_ride_characteristics)).

% @attr pop
% @type categorical
% @canonical false
% @original_name pop
% @values exceptional=Exceptional_monster_pop_tons_of_spring unk_pop=Unknown
% @importance 0.90

0.85::acc(s37, pop).

0.69::true_val(pop, exceptional); 0.31::true_val(pop, unk_pop).

measured(s37, pop, exceptional).

all_consistent(pop) :- consistent(s37, pop).

evidence(all_consistent(pop)).
query(true_val(pop, exceptional)).
query(true_val(pop, unk_pop)).

% @attr edge_hold
% @type categorical
% @canonical false
% @original_name edge_hold
% @values excellent=Excellent_Magne_Traction_strong_grip unk_edge_hold=Unknown
% @importance 0.90

0.85::acc(s37, edge_hold).

0.69::true_val(edge_hold, excellent); 0.31::true_val(edge_hold, unk_edge_hold).

measured(s37, edge_hold, excellent).

all_consistent(edge_hold) :- consistent(s37, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, excellent)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr stability_at_speed
% @type categorical
% @canonical false
% @original_name Stability at speed
% @values good_wants_to_go_fast=Good_at_high_speeds_wants_to_go_fast unk_stability_at_speed=Unknown
% @importance 0.90

0.85::acc(s37, stability_at_speed).

0.69::true_val(stability_at_speed, good_wants_to_go_fast); 0.31::true_val(stability_at_speed, unk_stability_at_speed).

measured(s37, stability_at_speed, good_wants_to_go_fast).

all_consistent(stability_at_speed) :- consistent(s37, stability_at_speed).

evidence(all_consistent(stability_at_speed)).
query(true_val(stability_at_speed, good_wants_to_go_fast)).
query(true_val(stability_at_speed, unk_stability_at_speed)).

% @attr powder_float
% @type categorical
% @canonical false
% @original_name Powder float
% @values excellent=Excellent_long_nose_taper_great_float unk_powder_float=Unknown
% @importance 0.85

0.82::acc(s49, powder_float).

0.63::true_val(powder_float, excellent); 0.37::true_val(powder_float, unk_powder_float).

measured(s49, powder_float, excellent).

all_consistent(powder_float) :- consistent(s49, powder_float).

evidence(all_consistent(powder_float)).
query(true_val(powder_float, excellent)).
query(true_val(powder_float, unk_powder_float)).

% @attr carving
% @type categorical
% @canonical false
% @original_name Carving
% @values deep_trenches_hardpack=Lays_deep_trenches_on_hardpack unk_carving=Unknown
% @importance 0.85

0.82::acc(s50, carving).

0.66::true_val(carving, deep_trenches_hardpack); 0.34::true_val(carving, unk_carving).

measured(s50, carving, deep_trenches_hardpack).

all_consistent(carving) :- consistent(s50, carving).

evidence(all_consistent(carving)).
query(true_val(carving, deep_trenches_hardpack)).
query(true_val(carving, unk_carving)).

% @attr switch_riding
% @type categorical
% @canonical false
% @original_name switch_riding
% @values good_for_directional=Good_for_directional_power_kink_tail_helps unk_switch_riding=Unknown
% @importance 0.85

0.85::acc(s33, switch_riding).

0.76::true_val(switch_riding, good_for_directional); 0.24::true_val(switch_riding, unk_switch_riding).

measured(s33, switch_riding, good_for_directional).

all_consistent(switch_riding) :- consistent(s33, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good_for_directional)).
query(true_val(switch_riding, unk_switch_riding)).

% @attr tree_riding
% @type categorical
% @canonical false
% @original_name Tree riding
% @values weapon_effortless_pivot=Weapon_in_the_trees_effortless_pivoting unk_tree_riding=Unknown
% @importance 0.85

0.80::acc(s44, tree_riding).

0.63::true_val(tree_riding, weapon_effortless_pivot); 0.37::true_val(tree_riding, unk_tree_riding).

measured(s44, tree_riding, weapon_effortless_pivot).

all_consistent(tree_riding) :- consistent(s44, tree_riding).

evidence(all_consistent(tree_riding)).
query(true_val(tree_riding, weapon_effortless_pivot)).
query(true_val(tree_riding, unk_tree_riding)).

% @attr buttering
% @type categorical
% @canonical false
% @original_name Buttering
% @values easy_despite_stiffness=Easy_to_butter_despite_stiffness_rocker_helps unk_buttering=Unknown
% @importance 0.85

0.82::acc(s35, buttering).

0.69::true_val(buttering, easy_despite_stiffness); 0.31::true_val(buttering, unk_buttering).

measured(s35, buttering, easy_despite_stiffness).

all_consistent(buttering) :- consistent(s35, buttering).

evidence(all_consistent(buttering)).
query(true_val(buttering, easy_despite_stiffness)).
query(true_val(buttering, unk_buttering)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values quick_edge_to_edge=Quick_edge_to_edge unk_turn_initiation_performance=Unknown
% @importance 0.85

0.82::acc(s35, turn_initiation_performance).

0.69::true_val(turn_initiation_performance, quick_edge_to_edge); 0.31::true_val(turn_initiation_performance, unk_turn_initiation_performance).

measured(s35, turn_initiation_performance, quick_edge_to_edge).

all_consistent(turn_initiation_performance) :- consistent(s35, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, quick_edge_to_edge)).
query(true_val(turn_initiation_performance, unk_turn_initiation_performance)).

% @attr chatter_performance
% @type categorical
% @canonical true
% @original_name chatter_performance
% @values some_tip_tail_chatter_manageable=Some_tip_tail_chatter_but_not_bucking unk_chatter_performance=Unknown
% @importance 0.80

0.85::acc(s48, chatter_performance).

0.68::true_val(chatter_performance, some_tip_tail_chatter_manageable); 0.32::true_val(chatter_performance, unk_chatter_performance).

measured(s48, chatter_performance, some_tip_tail_chatter_manageable).

all_consistent(chatter_performance) :- consistent(s48, chatter_performance).

evidence(all_consistent(chatter_performance)).
query(true_val(chatter_performance, some_tip_tail_chatter_manageable)).
query(true_val(chatter_performance, unk_chatter_performance)).

% @attr responsiveness
% @type categorical
% @canonical false
% @original_name Responsiveness
% @values high_from_firepower=High_responsiveness_from_Firepower_construction unk_responsiveness=Unknown
% @importance 0.75

0.72::acc(s43, responsiveness).

0.49::true_val(responsiveness, high_from_firepower); 0.51::true_val(responsiveness, unk_responsiveness).

measured(s43, responsiveness, high_from_firepower).

all_consistent(responsiveness) :-
    (indep(s43), consistent(s43, responsiveness) ; \+indep(s43)).

evidence(all_consistent(responsiveness)).
query(true_val(responsiveness, high_from_firepower)).
query(true_val(responsiveness, unk_responsiveness)).

% @attr positive_aspect
% @type categorical
% @canonical false
% @original_name positive_aspect
% @values good_one_board_quiver=Good_one_board_quiver_less_directional_than_Orca unk_positive_aspect=Unknown
% @importance 0.85

0.82::acc(s35, positive_aspect).

0.69::true_val(positive_aspect, good_one_board_quiver); 0.31::true_val(positive_aspect, unk_positive_aspect).

measured(s35, positive_aspect, good_one_board_quiver).

all_consistent(positive_aspect) :- consistent(s35, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, good_one_board_quiver)).
query(true_val(positive_aspect, unk_positive_aspect)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_mountain_powder_freeride=All_mountain_powder_freeride unk_terrain_suitability=Unknown
% @importance 0.85

0.85::acc(s_m, terrain_suitability).

0.95::true_val(terrain_suitability, all_mountain_powder_freeride); 0.05::true_val(terrain_suitability, unk_terrain_suitability).

measured(s_m, terrain_suitability, all_mountain_powder_freeride).

all_consistent(terrain_suitability) :- consistent(s_m, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_mountain_powder_freeride)).
query(true_val(terrain_suitability, unk_terrain_suitability)).

% @attr terrain_suitability_all_mountain
% @type numeric
% @canonical false
% @original_name terrain_suitability (All Mountain rating)
% @unit /10
% @values v10=10.0 unk_terrain_suitability_all_mountain=Unknown
% @importance 0.80

0.70::acc(s40, terrain_suitability_all_mountain).

0.51::true_val(terrain_suitability_all_mountain, v10); 0.49::true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain).

measured(s40, terrain_suitability_all_mountain, v10).

all_consistent(terrain_suitability_all_mountain) :- consistent(s40, terrain_suitability_all_mountain).

evidence(all_consistent(terrain_suitability_all_mountain)).
query(true_val(terrain_suitability_all_mountain, v10)).
query(true_val(terrain_suitability_all_mountain, unk_terrain_suitability_all_mountain)).

% @attr terrain_suitability_powder
% @type numeric
% @canonical false
% @original_name terrain_suitability (Powder rating)
% @unit /10
% @values v7=7.0 unk_terrain_suitability_powder=Unknown
% @importance 0.80

0.70::acc(s40, terrain_suitability_powder).

0.51::true_val(terrain_suitability_powder, v7); 0.49::true_val(terrain_suitability_powder, unk_terrain_suitability_powder).

measured(s40, terrain_suitability_powder, v7).

all_consistent(terrain_suitability_powder) :- consistent(s40, terrain_suitability_powder).

evidence(all_consistent(terrain_suitability_powder)).
query(true_val(terrain_suitability_powder, v7)).
query(true_val(terrain_suitability_powder, unk_terrain_suitability_powder)).

% @attr terrain_suitability_park
% @type numeric
% @canonical false
% @original_name terrain_suitability (Park rating)
% @unit /10
% @values v7=7.0 unk_terrain_suitability_park=Unknown
% @importance 0.80

0.70::acc(s40, terrain_suitability_park).

0.51::true_val(terrain_suitability_park, v7); 0.49::true_val(terrain_suitability_park, unk_terrain_suitability_park).

measured(s40, terrain_suitability_park, v7).

all_consistent(terrain_suitability_park) :- consistent(s40, terrain_suitability_park).

evidence(all_consistent(terrain_suitability_park)).
query(true_val(terrain_suitability_park, v7)).
query(true_val(terrain_suitability_park, unk_terrain_suitability_park)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate_advanced=Intermediate_Advanced unk_rider_level=Unknown
% @importance 0.85

0.85::acc(s_m, rider_level).

0.95::true_val(rider_level, intermediate_advanced); 0.05::true_val(rider_level, unk_rider_level).

measured(s_m, rider_level, intermediate_advanced).

all_consistent(rider_level) :- consistent(s_m, rider_level).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate_advanced)).
query(true_val(rider_level, unk_rider_level)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values committed_intermediate_to_expert=Committed_intermediate_to_expert intermediate_to_advanced=Intermediate_to_advanced
% @importance 0.85

0.85::acc(s37, skill_level_recommendation).
0.82::acc(s51, skill_level_recommendation).

0.55::true_val(skill_level_recommendation, committed_intermediate_to_expert); 0.45::true_val(skill_level_recommendation, intermediate_to_advanced).

measured(s37, skill_level_recommendation, committed_intermediate_to_expert).
measured(s51, skill_level_recommendation, intermediate_to_advanced).

all_consistent(skill_level_recommendation) :-
    consistent(s37, skill_level_recommendation),
    consistent(s51, skill_level_recommendation).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, committed_intermediate_to_expert)).
query(true_val(skill_level_recommendation, intermediate_to_advanced)).

% @attr boot_size_fit
% @type categorical
% @canonical false
% @original_name Boot size fit
% @values size_10_us_plus=Best_for_size_10_US_boot_and_up unk_boot_size_fit=Unknown
% @importance 0.80

0.82::acc(s36, boot_size_fit).

0.68::true_val(boot_size_fit, size_10_us_plus); 0.32::true_val(boot_size_fit, unk_boot_size_fit).

measured(s36, boot_size_fit, size_10_us_plus).

all_consistent(boot_size_fit) :- consistent(s36, boot_size_fit).

evidence(all_consistent(boot_size_fit)).
query(true_val(boot_size_fit, size_10_us_plus)).
query(true_val(boot_size_fit, unk_boot_size_fit)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values not_for_beginners_groomers_twin=Beginners_groomer_riders_twin_preference unk_negative_aspect=Unknown
% @importance 0.85

0.80::acc(s44, negative_aspect).

0.63::true_val(negative_aspect, not_for_beginners_groomers_twin); 0.37::true_val(negative_aspect, unk_negative_aspect).

measured(s44, negative_aspect, not_for_beginners_groomers_twin).

all_consistent(negative_aspect) :- consistent(s44, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, not_for_beginners_groomers_twin)).
query(true_val(negative_aspect, unk_negative_aspect)).

% @attr skill_level_recommendation_target_rider
% @type categorical
% @canonical false
% @original_name skill_level_recommendation (target rider)
% @values soft_snow_off_trail=Those_who_prioritize_soft_snow_off_trail unk_skill_level_recommendation_target_rider=Unknown
% @importance 0.85

0.80::acc(s44, skill_level_recommendation_target_rider).

0.63::true_val(skill_level_recommendation_target_rider, soft_snow_off_trail); 0.37::true_val(skill_level_recommendation_target_rider, unk_skill_level_recommendation_target_rider).

measured(s44, skill_level_recommendation_target_rider, soft_snow_off_trail).

all_consistent(skill_level_recommendation_target_rider) :- consistent(s44, skill_level_recommendation_target_rider).

evidence(all_consistent(skill_level_recommendation_target_rider)).
query(true_val(skill_level_recommendation_target_rider, soft_snow_off_trail)).
query(true_val(skill_level_recommendation_target_rider, unk_skill_level_recommendation_target_rider)).

% @attr board_weight_grams
% @type categorical
% @canonical true
% @original_name board_weight_grams
% @values slightly_heavier_than_average=Slightly_heavier_than_average unk_board_weight_grams=Unknown
% @importance 0.70

0.78::acc(s52, board_weight_grams).

0.63::true_val(board_weight_grams, slightly_heavier_than_average); 0.37::true_val(board_weight_grams, unk_board_weight_grams).

measured(s52, board_weight_grams, slightly_heavier_than_average).

all_consistent(board_weight_grams) :- consistent(s52, board_weight_grams).

evidence(all_consistent(board_weight_grams)).
query(true_val(board_weight_grams, slightly_heavier_than_average)).
query(true_val(board_weight_grams, unk_board_weight_grams)).

% @attr weight_per_cm
% @type categorical
% @canonical false
% @original_name weight_per_cm
% @values likely_normal_per_surface_area=Wide_board_size_down_grams_per_area_normal unk_weight_per_cm=Unknown
% @importance 0.70

0.78::acc(s52, weight_per_cm).

0.63::true_val(weight_per_cm, likely_normal_per_surface_area); 0.37::true_val(weight_per_cm, unk_weight_per_cm).

measured(s52, weight_per_cm, likely_normal_per_surface_area).

all_consistent(weight_per_cm) :- consistent(s52, weight_per_cm).

evidence(all_consistent(weight_per_cm)).
query(true_val(weight_per_cm, likely_normal_per_surface_area)).
query(true_val(weight_per_cm, unk_weight_per_cm)).

% @attr overall_rating_snowboardingprofiles
% @type numeric
% @canonical true
% @original_name overall_rating_snowboardingprofiles
% @unit /100
% @values v85_9=85.9 unk_overall_rating_snowboardingprofiles=Unknown
% @importance 0.85

0.82::acc(s39, overall_rating_snowboardingprofiles).

0.67::true_val(overall_rating_snowboardingprofiles, v85_9); 0.33::true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles).

measured(s39, overall_rating_snowboardingprofiles, v85_9).

all_consistent(overall_rating_snowboardingprofiles) :- consistent(s39, overall_rating_snowboardingprofiles).

evidence(all_consistent(overall_rating_snowboardingprofiles)).
query(true_val(overall_rating_snowboardingprofiles, v85_9)).
query(true_val(overall_rating_snowboardingprofiles, unk_overall_rating_snowboardingprofiles)).

% @attr reviewer_opinion_snowboardingprofiles
% @type categorical
% @canonical false
% @original_name reviewer_opinion_snowboardingprofiles
% @values rank_13_of_27_freeride=13th_out_of_27_freeride_snowboards unk_reviewer_opinion_snowboardingprofiles=Unknown
% @importance 0.85

0.82::acc(s39, reviewer_opinion_snowboardingprofiles).

0.67::true_val(reviewer_opinion_snowboardingprofiles, rank_13_of_27_freeride); 0.33::true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles).

measured(s39, reviewer_opinion_snowboardingprofiles, rank_13_of_27_freeride).

all_consistent(reviewer_opinion_snowboardingprofiles) :- consistent(s39, reviewer_opinion_snowboardingprofiles).

evidence(all_consistent(reviewer_opinion_snowboardingprofiles)).
query(true_val(reviewer_opinion_snowboardingprofiles, rank_13_of_27_freeride)).
query(true_val(reviewer_opinion_snowboardingprofiles, unk_reviewer_opinion_snowboardingprofiles)).

% @attr lib_tech_website_rating
% @type categorical
% @canonical false
% @original_name Lib Tech website rating
% @values v100_pct_4_reviews=100pct_of_100_from_4_reviews unk_lib_tech_website_rating=Unknown
% @importance 1.0

0.80::acc(s16, lib_tech_website_rating).

0.78::true_val(lib_tech_website_rating, v100_pct_4_reviews); 0.22::true_val(lib_tech_website_rating, unk_lib_tech_website_rating).

measured(s16, lib_tech_website_rating, v100_pct_4_reviews).

all_consistent(lib_tech_website_rating) :- consistent(s16, lib_tech_website_rating).

evidence(all_consistent(lib_tech_website_rating)).
query(true_val(lib_tech_website_rating, v100_pct_4_reviews)).
query(true_val(lib_tech_website_rating, unk_lib_tech_website_rating)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values between_orca_trice_pointy_forgiving=Between_Orca_and_TRice_Pointy_forgiving_grippy_quiver unk_reviewer_opinion_the_good_ride=Unknown
% @importance 0.80

0.82::acc(s36, reviewer_opinion_the_good_ride).

0.68::true_val(reviewer_opinion_the_good_ride, between_orca_trice_pointy_forgiving); 0.32::true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride).

measured(s36, reviewer_opinion_the_good_ride, between_orca_trice_pointy_forgiving).

all_consistent(reviewer_opinion_the_good_ride) :- consistent(s36, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, between_orca_trice_pointy_forgiving)).
query(true_val(reviewer_opinion_the_good_ride, unk_reviewer_opinion_the_good_ride)).

% @attr evo_review_summary
% @type categorical
% @canonical false
% @original_name Evo review summary
% @values one_board_quiver_powder_groomers_park=Can_be_1_board_quiver_powder_groomers_park unk_evo_review_summary=Unknown
% @importance 0.85

0.82::acc(s50, evo_review_summary).

0.66::true_val(evo_review_summary, one_board_quiver_powder_groomers_park); 0.34::true_val(evo_review_summary, unk_evo_review_summary).

measured(s50, evo_review_summary, one_board_quiver_powder_groomers_park).

all_consistent(evo_review_summary) :- consistent(s50, evo_review_summary).

evidence(all_consistent(evo_review_summary)).
query(true_val(evo_review_summary, one_board_quiver_powder_groomers_park)).
query(true_val(evo_review_summary, unk_evo_review_summary)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values freestyle_prowess_sought_after=Freestyle_prowess_highly_sought_after unk_reviewer_opinion_whitelines=Unknown
% @importance 0.75

0.80::acc(s7, reviewer_opinion_whitelines).

0.76::true_val(reviewer_opinion_whitelines, freestyle_prowess_sought_after); 0.24::true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines).

measured(s7, reviewer_opinion_whitelines, freestyle_prowess_sought_after).

all_consistent(reviewer_opinion_whitelines) :- consistent(s7, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, freestyle_prowess_sought_after)).
query(true_val(reviewer_opinion_whitelines, unk_reviewer_opinion_whitelines)).

% @attr ski_monster_review
% @type categorical
% @canonical false
% @original_name The Ski Monster review
% @values all_mountain_powerhouse_most_versatile_orca=All_mountain_powerhouse_most_versatile_Orca_series unk_ski_monster_review=Unknown
% @importance 0.70

0.76::acc(s53, ski_monster_review).

0.57::true_val(ski_monster_review, all_mountain_powerhouse_most_versatile_orca); 0.43::true_val(ski_monster_review, unk_ski_monster_review).

measured(s53, ski_monster_review, all_mountain_powerhouse_most_versatile_orca).

all_consistent(ski_monster_review) :- consistent(s53, ski_monster_review).

evidence(all_consistent(ski_monster_review)).
query(true_val(ski_monster_review, all_mountain_powerhouse_most_versatile_orca)).
query(true_val(ski_monster_review, unk_ski_monster_review)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values overhyped_but_great_powder=Orca_family_overhyped_by_some_but_great_in_powder unk_user_review_forum=Unknown
% @importance 0.75

0.55::acc(s54, user_review_forum).

0.31::true_val(user_review_forum, overhyped_but_great_powder); 0.69::true_val(user_review_forum, unk_user_review_forum).

measured(s54, user_review_forum, overhyped_but_great_powder).

all_consistent(user_review_forum) :- consistent(s54, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, overhyped_but_great_powder)).
query(true_val(user_review_forum, unk_user_review_forum)).

% @attr user_review_forum_hardpack
% @type categorical
% @canonical false
% @original_name user_review_forum (hardpack opinion)
% @values meh_on_hardpack_groomers=Meh_on_hardpack_groomers unk_user_review_forum_hardpack=Unknown
% @importance 0.75

0.55::acc(s54, user_review_forum_hardpack).

0.31::true_val(user_review_forum_hardpack, meh_on_hardpack_groomers); 0.69::true_val(user_review_forum_hardpack, unk_user_review_forum_hardpack).

measured(s54, user_review_forum_hardpack, meh_on_hardpack_groomers).

all_consistent(user_review_forum_hardpack) :- consistent(s54, user_review_forum_hardpack).

evidence(all_consistent(user_review_forum_hardpack)).
query(true_val(user_review_forum_hardpack, meh_on_hardpack_groomers)).
query(true_val(user_review_forum_hardpack, unk_user_review_forum_hardpack)).

% @attr reviewer_opinion_the_good_ride_autospin
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride (auto-spin observation)
% @values auto_spinny_flat_basing_harder_skid=Auto_spinny_flat_basing_harder_to_skid_than_C2 unk_reviewer_opinion_the_good_ride_autospin=Unknown
% @importance 0.90

0.82::acc(s37, reviewer_opinion_the_good_ride_autospin).

0.69::true_val(reviewer_opinion_the_good_ride_autospin, auto_spinny_flat_basing_harder_skid); 0.31::true_val(reviewer_opinion_the_good_ride_autospin, unk_reviewer_opinion_the_good_ride_autospin).

measured(s37, reviewer_opinion_the_good_ride_autospin, auto_spinny_flat_basing_harder_skid).

all_consistent(reviewer_opinion_the_good_ride_autospin) :- consistent(s37, reviewer_opinion_the_good_ride_autospin).

evidence(all_consistent(reviewer_opinion_the_good_ride_autospin)).
query(true_val(reviewer_opinion_the_good_ride_autospin, auto_spinny_flat_basing_harder_skid)).
query(true_val(reviewer_opinion_the_good_ride_autospin, unk_reviewer_opinion_the_good_ride_autospin)).

% @attr negative_aspect_price
% @type categorical
% @canonical false
% @original_name negative_aspect (price)
% @values high_price_tag=Main_weakness_high_price_tag unk_negative_aspect_price=Unknown
% @importance 0.85

0.82::acc(s55, negative_aspect_price).

0.66::true_val(negative_aspect_price, high_price_tag); 0.34::true_val(negative_aspect_price, unk_negative_aspect_price).

measured(s55, negative_aspect_price, high_price_tag).

all_consistent(negative_aspect_price) :- consistent(s55, negative_aspect_price).

evidence(all_consistent(negative_aspect_price)).
query(true_val(negative_aspect_price, high_price_tag)).
query(true_val(negative_aspect_price, unk_negative_aspect_price)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values yes_pyl_burton_fa_jones_flagship_etc=Yes_PYL_Burton_FA_Jones_Flagship_Cartographer_Instigator_Korua_Otto_Frontier unk_comparable_board_cross_brand=Unknown
% @importance 0.85

0.82::acc(s56, comparable_board_cross_brand).

0.68::true_val(comparable_board_cross_brand, yes_pyl_burton_fa_jones_flagship_etc); 0.32::true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand).

measured(s56, comparable_board_cross_brand, yes_pyl_burton_fa_jones_flagship_etc).

all_consistent(comparable_board_cross_brand) :- consistent(s56, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, yes_pyl_burton_fa_jones_flagship_etc)).
query(true_val(comparable_board_cross_brand, unk_comparable_board_cross_brand)).

% @attr comparable_board_same_brand
% @type categorical
% @canonical true
% @original_name comparable_board_same_brand
% @values orca_ii_trice_pro=Orca_II_T_Rice_Pro unk_comparable_board_same_brand=Unknown
% @importance 0.85

0.85::acc(s_m, comparable_board_same_brand).

0.95::true_val(comparable_board_same_brand, orca_ii_trice_pro); 0.05::true_val(comparable_board_same_brand, unk_comparable_board_same_brand).

measured(s_m, comparable_board_same_brand, orca_ii_trice_pro).

all_consistent(comparable_board_same_brand) :- consistent(s_m, comparable_board_same_brand).

evidence(all_consistent(comparable_board_same_brand)).
query(true_val(comparable_board_same_brand, orca_ii_trice_pro)).
query(true_val(comparable_board_same_brand, unk_comparable_board_same_brand)).

% @attr comparable_board_same_brand_vs_orca
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (vs Orca II)
% @values less_taper_less_setback_less_directional=Less_taper_less_setback_less_directional_than_Orca_II unk_comparable_board_same_brand_vs_orca=Unknown
% @importance 0.85

0.82::acc(s35, comparable_board_same_brand_vs_orca).

0.69::true_val(comparable_board_same_brand_vs_orca, less_taper_less_setback_less_directional); 0.31::true_val(comparable_board_same_brand_vs_orca, unk_comparable_board_same_brand_vs_orca).

measured(s35, comparable_board_same_brand_vs_orca, less_taper_less_setback_less_directional).

all_consistent(comparable_board_same_brand_vs_orca) :- consistent(s35, comparable_board_same_brand_vs_orca).

evidence(all_consistent(comparable_board_same_brand_vs_orca)).
query(true_val(comparable_board_same_brand_vs_orca, less_taper_less_setback_less_directional)).
query(true_val(comparable_board_same_brand_vs_orca, unk_comparable_board_same_brand_vs_orca)).

% @attr comparable_board_same_brand_positioning
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (lineup positioning)
% @values between_orca_and_trice_pointy=Between_Orca_and_TRice_Pointy_in_directional_feel unk_comparable_board_same_brand_positioning=Unknown
% @importance 0.80

0.82::acc(s36, comparable_board_same_brand_positioning).

0.68::true_val(comparable_board_same_brand_positioning, between_orca_and_trice_pointy); 0.32::true_val(comparable_board_same_brand_positioning, unk_comparable_board_same_brand_positioning).

measured(s36, comparable_board_same_brand_positioning, between_orca_and_trice_pointy).

all_consistent(comparable_board_same_brand_positioning) :- consistent(s36, comparable_board_same_brand_positioning).

evidence(all_consistent(comparable_board_same_brand_positioning)).
query(true_val(comparable_board_same_brand_positioning, between_orca_and_trice_pointy)).
query(true_val(comparable_board_same_brand_positioning, unk_comparable_board_same_brand_positioning)).

% @attr comparable_board_cross_brand_ranking
% @type categorical
% @canonical false
% @original_name comparable_board_cross_brand (ranking context)
% @values jones_flagship_rank1_golden_orca_rank13=Jones_Flagship_no1_Golden_Orca_no13 unk_comparable_board_cross_brand_ranking=Unknown
% @importance 0.75

0.75::acc(s57, comparable_board_cross_brand_ranking).

0.56::true_val(comparable_board_cross_brand_ranking, jones_flagship_rank1_golden_orca_rank13); 0.44::true_val(comparable_board_cross_brand_ranking, unk_comparable_board_cross_brand_ranking).

measured(s57, comparable_board_cross_brand_ranking, jones_flagship_rank1_golden_orca_rank13).

all_consistent(comparable_board_cross_brand_ranking) :- consistent(s57, comparable_board_cross_brand_ranking).

evidence(all_consistent(comparable_board_cross_brand_ranking)).
query(true_val(comparable_board_cross_brand_ranking, jones_flagship_rank1_golden_orca_rank13)).
query(true_val(comparable_board_cross_brand_ranking, unk_comparable_board_cross_brand_ranking)).

% @attr comparable_board_same_brand_apex
% @type categorical
% @canonical false
% @original_name comparable_board_same_brand (Apex variant)
% @values apex_carbon_magnesium_higher_price=Higher_end_Apex_version_carbon_magnesium_higher_price unk_comparable_board_same_brand_apex=Unknown
% @importance 0.60

0.85::acc(s58, comparable_board_same_brand_apex).

0.74::true_val(comparable_board_same_brand_apex, apex_carbon_magnesium_higher_price); 0.26::true_val(comparable_board_same_brand_apex, unk_comparable_board_same_brand_apex).

measured(s58, comparable_board_same_brand_apex, apex_carbon_magnesium_higher_price).

all_consistent(comparable_board_same_brand_apex) :- consistent(s58, comparable_board_same_brand_apex).

evidence(all_consistent(comparable_board_same_brand_apex)).
query(true_val(comparable_board_same_brand_apex, apex_carbon_magnesium_higher_price)).
query(true_val(comparable_board_same_brand_apex, unk_comparable_board_same_brand_apex)).

% @attr warranty_period_years
% @type numeric
% @canonical true
% @original_name warranty_period_years
% @unit years
% @values v1=1.0 v2=2.0
% @importance 0.80

0.95::acc(s59, warranty_period_years).
0.50::acc(s60, warranty_period_years).

0.75::true_val(warranty_period_years, v1); 0.25::true_val(warranty_period_years, v2).

measured(s59, warranty_period_years, v1).
measured(s60, warranty_period_years, v2).

all_consistent(warranty_period_years) :-
    consistent(s59, warranty_period_years),
    consistent(s60, warranty_period_years).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v1)).
query(true_val(warranty_period_years, v2)).

% @attr warranty_coverage
% @type categorical
% @canonical false
% @original_name warranty
% @values structural_defects_only=Structural_defects_only_no_impact_abuse_wear unk_warranty_coverage=Unknown
% @importance 0.80

0.95::acc(s59, warranty_coverage).

0.92::true_val(warranty_coverage, structural_defects_only); 0.08::true_val(warranty_coverage, unk_warranty_coverage).

measured(s59, warranty_coverage, structural_defects_only).

all_consistent(warranty_coverage) :- consistent(s59, warranty_coverage).

evidence(all_consistent(warranty_coverage)).
query(true_val(warranty_coverage, structural_defects_only)).
query(true_val(warranty_coverage, unk_warranty_coverage)).

% @attr user_review_forum_warranty
% @type categorical
% @canonical false
% @original_name user_review_forum (warranty experience)
% @values generally_praised_above_beyond=Generally_praised_above_and_beyond_warranty_claims unk_user_review_forum_warranty=Unknown
% @importance 0.65

0.52::acc(s61, user_review_forum_warranty).

0.30::true_val(user_review_forum_warranty, generally_praised_above_beyond); 0.70::true_val(user_review_forum_warranty, unk_user_review_forum_warranty).

measured(s61, user_review_forum_warranty, generally_praised_above_beyond).

all_consistent(user_review_forum_warranty) :- consistent(s61, user_review_forum_warranty).

evidence(all_consistent(user_review_forum_warranty)).
query(true_val(user_review_forum_warranty, generally_praised_above_beyond)).
query(true_val(user_review_forum_warranty, unk_user_review_forum_warranty)).

% @attr sustainability_certification_fsc
% @type categorical
% @canonical false
% @original_name sustainability_certification (FSC)
% @values fsc_certified_core=FSC_certified_core_wood unk_sustainability_certification_fsc=Unknown
% @importance 0.80

0.68::acc(s45, sustainability_certification_fsc).

0.54::true_val(sustainability_certification_fsc, fsc_certified_core); 0.46::true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc).

measured(s45, sustainability_certification_fsc, fsc_certified_core).

all_consistent(sustainability_certification_fsc) :-
    (indep(s45), consistent(s45, sustainability_certification_fsc) ; \+indep(s45)).

evidence(all_consistent(sustainability_certification_fsc)).
query(true_val(sustainability_certification_fsc, fsc_certified_core)).
query(true_val(sustainability_certification_fsc, unk_sustainability_certification_fsc)).

% @attr sustainability_certification_pbt
% @type categorical
% @canonical false
% @original_name sustainability_certification (PBT topsheet)
% @values ocean_bound_pbt_recycled=Ocean_bound_PBT_from_recycled_PET_plastic unk_sustainability_certification_pbt=Unknown
% @importance 1.0

0.93::acc(s16, sustainability_certification_pbt).

0.92::true_val(sustainability_certification_pbt, ocean_bound_pbt_recycled); 0.08::true_val(sustainability_certification_pbt, unk_sustainability_certification_pbt).

measured(s16, sustainability_certification_pbt, ocean_bound_pbt_recycled).

all_consistent(sustainability_certification_pbt) :- consistent(s16, sustainability_certification_pbt).

evidence(all_consistent(sustainability_certification_pbt)).
query(true_val(sustainability_certification_pbt, ocean_bound_pbt_recycled)).
query(true_val(sustainability_certification_pbt, unk_sustainability_certification_pbt)).

% @attr sustainability_certification_orca_conservation
% @type categorical
% @canonical false
% @original_name sustainability_certification (Orca conservation)
% @values portion_sale_orca_prevention=Portion_of_sale_to_orca_extinction_prevention unk_sustainability_certification_orca_conservation=Unknown
% @importance 0.35

0.60::acc(s62, sustainability_certification_orca_conservation).

0.40::true_val(sustainability_certification_orca_conservation, portion_sale_orca_prevention); 0.60::true_val(sustainability_certification_orca_conservation, unk_sustainability_certification_orca_conservation).

measured(s62, sustainability_certification_orca_conservation, portion_sale_orca_prevention).

all_consistent(sustainability_certification_orca_conservation) :- consistent(s62, sustainability_certification_orca_conservation).

evidence(all_consistent(sustainability_certification_orca_conservation)).
query(true_val(sustainability_certification_orca_conservation, portion_sale_orca_prevention)).
query(true_val(sustainability_certification_orca_conservation, unk_sustainability_certification_orca_conservation)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values merge_orca_powder_trice_freestyle=Merge_Orca_powder_shape_with_TRice_Pro_freestyle unk_design_philosophy=Unknown
% @importance 1.0

0.93::acc(s16, design_philosophy).

0.92::true_val(design_philosophy, merge_orca_powder_trice_freestyle); 0.08::true_val(design_philosophy, unk_design_philosophy).

measured(s16, design_philosophy, merge_orca_powder_trice_freestyle).

all_consistent(design_philosophy) :- consistent(s16, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, merge_orca_powder_trice_freestyle)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values natural_selection_competition=Travis_Rice_Natural_Selection_competition_needs unk_design_inspiration=Unknown
% @importance 0.60

0.68::acc(s30, design_inspiration).

0.51::true_val(design_inspiration, natural_selection_competition); 0.49::true_val(design_inspiration, unk_design_inspiration).

measured(s30, design_inspiration, natural_selection_competition).

all_consistent(design_inspiration) :- consistent(s30, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, natural_selection_competition)).
query(true_val(design_inspiration, unk_design_inspiration)).