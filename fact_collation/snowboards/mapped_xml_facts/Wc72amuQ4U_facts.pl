0.15::indep(s_merchant).
0.15::indep(s2).
0.12::indep(s8).
0.10::indep(s10).
0.15::indep(s29).
0.12::indep(s30).
0.12::indep(s7).
0.10::indep(s14).
0.12::indep(s68).
0.12::indep(s64).
0.10::indep(s42).
0.10::indep(s59).
0.12::indep(s63).

consistent(S, A) :- acc(S, A), measured(S, A, V), true_val(A, V).
consistent(S, A) :- \+acc(S, A).

% @attr brand
% @type categorical
% @canonical true
% @original_name brand
% @values burton=Burton unk_brand=Unknown
% @importance 0.78

0.90::acc(s1, brand).
0.80::acc(s14, brand).

0.95::true_val(brand, burton); 0.05::true_val(brand, unk_brand).

measured(s1, brand, burton).
measured(s14, brand, burton).

all_consistent(brand) :-
    consistent(s1, brand),
    (indep(s14), consistent(s14, brand) ; \+indep(s14)).

evidence(all_consistent(brand)).
query(true_val(brand, burton)).
query(true_val(brand, unk_brand)).

% @attr model_name
% @type categorical
% @canonical true
% @original_name model_name
% @values counterbalance_deco=Counterbalance_Deco unk_model_name=Unknown
% @importance 0.78

0.90::acc(s1, model_name).
0.80::acc(s14, model_name).

0.95::true_val(model_name, counterbalance_deco); 0.05::true_val(model_name, unk_model_name).

measured(s1, model_name, counterbalance_deco).
measured(s14, model_name, counterbalance_deco).

all_consistent(model_name) :-
    consistent(s1, model_name),
    (indep(s14), consistent(s14, model_name) ; \+indep(s14)).

evidence(all_consistent(model_name)).
query(true_val(model_name, counterbalance_deco)).
query(true_val(model_name, unk_model_name)).

% @attr available_colors
% @type categorical
% @canonical true
% @original_name available_colors
% @values hallucinate_psychedelic_floral=Counterbalance_Hallucinate_psychedelic_floral_by_Dylan_West unk_available_colors=Unknown
% @importance 0.35

0.93::acc(s6, available_colors).
0.85::acc(s4, available_colors).

0.95::true_val(available_colors, hallucinate_psychedelic_floral); 0.05::true_val(available_colors, unk_available_colors).

measured(s6, available_colors, hallucinate_psychedelic_floral).
measured(s4, available_colors, hallucinate_psychedelic_floral).

all_consistent(available_colors) :-
    consistent(s6, available_colors),
    consistent(s4, available_colors).

evidence(all_consistent(available_colors)).
query(true_val(available_colors, hallucinate_psychedelic_floral)).
query(true_val(available_colors, unk_available_colors)).

% @attr graphic_designer_artist
% @type categorical
% @canonical true
% @original_name graphic_designer_artist
% @values sophie_sellstrom_art_deco=Sophie_Sellstrom_art_deco_floral unk_graphic_designer_artist=Unknown
% @importance 0.35

0.93::acc(s6, graphic_designer_artist).

0.90::true_val(graphic_designer_artist, sophie_sellstrom_art_deco); 0.10::true_val(graphic_designer_artist, unk_graphic_designer_artist).

measured(s6, graphic_designer_artist, sophie_sellstrom_art_deco).

all_consistent(graphic_designer_artist) :-
    consistent(s6, graphic_designer_artist).

evidence(all_consistent(graphic_designer_artist)).
query(true_val(graphic_designer_artist, sophie_sellstrom_art_deco)).
query(true_val(graphic_designer_artist, unk_graphic_designer_artist)).

% @attr model_year
% @type categorical
% @canonical true
% @original_name model_year
% @values y2026=2026 unk_model_year=Unknown
% @importance 0.88

0.88::acc(s1, model_year).
0.90::acc(s4, model_year).

0.95::true_val(model_year, y2026); 0.05::true_val(model_year, unk_model_year).

measured(s1, model_year, y2026).
measured(s4, model_year, y2026).

all_consistent(model_year) :-
    consistent(s1, model_year),
    consistent(s4, model_year).

evidence(all_consistent(model_year)).
query(true_val(model_year, y2026)).
query(true_val(model_year, unk_model_year)).

% @attr product_type
% @type categorical
% @canonical true
% @original_name product_type
% @values snowboard=Snowboard unk_product_type=Unknown
% @importance 0.90

0.88::acc(s1, product_type).
0.90::acc(s2, product_type).

0.95::true_val(product_type, snowboard); 0.05::true_val(product_type, unk_product_type).

measured(s1, product_type, snowboard).
measured(s2, product_type, snowboard).

all_consistent(product_type) :-
    consistent(s1, product_type),
    (indep(s2), consistent(s2, product_type) ; \+indep(s2)).

evidence(all_consistent(product_type)).
query(true_val(product_type, snowboard)).
query(true_val(product_type, unk_product_type)).

% @attr board_category
% @type categorical
% @canonical true
% @original_name board_category
% @values all_mountain_freeride=All_Mountain_Freeride unk_board_category=Unknown
% @importance 0.90

0.88::acc(s1, board_category).
0.90::acc(s2, board_category).

0.95::true_val(board_category, all_mountain_freeride); 0.05::true_val(board_category, unk_board_category).

measured(s1, board_category, all_mountain_freeride).
measured(s2, board_category, all_mountain_freeride).

all_consistent(board_category) :-
    consistent(s1, board_category),
    (indep(s2), consistent(s2, board_category) ; \+indep(s2)).

evidence(all_consistent(board_category)).
query(true_val(board_category, all_mountain_freeride)).
query(true_val(board_category, unk_board_category)).

% @attr first_model_year
% @type categorical
% @canonical false
% @original_name New for 2026 — this is the first year for the Counterbalance model
% @values new_for_2026=New_for_2026 unk_first_model_year=Unknown
% @importance 0.88

0.90::acc(s4, first_model_year).
0.88::acc(s12, first_model_year).

0.95::true_val(first_model_year, new_for_2026); 0.05::true_val(first_model_year, unk_first_model_year).

measured(s4, first_model_year, new_for_2026).
measured(s12, first_model_year, new_for_2026).

all_consistent(first_model_year) :-
    consistent(s4, first_model_year),
    consistent(s12, first_model_year).

evidence(all_consistent(first_model_year)).
query(true_val(first_model_year, new_for_2026)).
query(true_val(first_model_year, unk_first_model_year)).

% @attr manufacturer
% @type categorical
% @canonical true
% @original_name manufacturer
% @values burton_snowboards_inc=Burton_Snowboards_Inc unk_manufacturer=Unknown
% @importance 0.60

0.88::acc(s7, manufacturer).

0.71::true_val(manufacturer, burton_snowboards_inc); 0.29::true_val(manufacturer, unk_manufacturer).

measured(s7, manufacturer, burton_snowboards_inc).

all_consistent(manufacturer) :-
    consistent(s7, manufacturer).

evidence(all_consistent(manufacturer)).
query(true_val(manufacturer, burton_snowboards_inc)).
query(true_val(manufacturer, unk_manufacturer)).

% @attr manufacturer_headquarters
% @type categorical
% @canonical false
% @original_name Manufacturer headquarters
% @values burlington_vt=180_Queen_City_Park_Rd_Burlington_VT_05401_USA unk_manufacturer_headquarters=Unknown
% @importance 0.60

0.90::acc(s7, manufacturer_headquarters).

0.71::true_val(manufacturer_headquarters, burlington_vt); 0.29::true_val(manufacturer_headquarters, unk_manufacturer_headquarters).

measured(s7, manufacturer_headquarters, burlington_vt).

all_consistent(manufacturer_headquarters) :-
    consistent(s7, manufacturer_headquarters).

evidence(all_consistent(manufacturer_headquarters)).
query(true_val(manufacturer_headquarters, burlington_vt)).
query(true_val(manufacturer_headquarters, unk_manufacturer_headquarters)).

% @attr european_representative
% @type categorical
% @canonical false
% @original_name European representative
% @values innsbruck_austria=Burton_Snowboards_GmbH_Innsbruck_Austria unk_european_representative=Unknown
% @importance 0.60

0.90::acc(s7, european_representative).

0.71::true_val(european_representative, innsbruck_austria); 0.29::true_val(european_representative, unk_european_representative).

measured(s7, european_representative, innsbruck_austria).

all_consistent(european_representative) :-
    consistent(s7, european_representative).

evidence(all_consistent(european_representative)).
query(true_val(european_representative, innsbruck_austria)).
query(true_val(european_representative, unk_european_representative)).

% @attr australian_office
% @type categorical
% @canonical false
% @original_name Australian office
% @values brookvale_nsw=Burton_Australia_6_Green_St_Brookvale_2100_NSW unk_australian_office=Unknown
% @importance 0.85

0.93::acc(s60, australian_office).

0.90::true_val(australian_office, brookvale_nsw); 0.10::true_val(australian_office, unk_australian_office).

measured(s60, australian_office, brookvale_nsw).

all_consistent(australian_office) :-
    consistent(s60, australian_office).

evidence(all_consistent(australian_office)).
query(true_val(australian_office, brookvale_nsw)).
query(true_val(australian_office, unk_australian_office)).

% @attr founding_year
% @type categorical
% @canonical false
% @original_name Burton was founded by Jake Burton Carpenter in 1977
% @values y1977=1977 unk_founding_year=Unknown
% @importance 0.50

0.80::acc(s87, founding_year).

0.61::true_val(founding_year, y1977); 0.39::true_val(founding_year, unk_founding_year).

measured(s87, founding_year, y1977).

all_consistent(founding_year) :-
    consistent(s87, founding_year).

evidence(all_consistent(founding_year)).
query(true_val(founding_year, y1977)).
query(true_val(founding_year, unk_founding_year)).

% @attr ownership_structure
% @type categorical
% @canonical false
% @original_name Burton is privately owned; Donna Carpenter has been CEO
% @values private_donna_carpenter=Privately_owned_Donna_Carpenter_CEO unk_ownership_structure=Unknown
% @importance 0.50

0.78::acc(s87, ownership_structure).

0.61::true_val(ownership_structure, private_donna_carpenter); 0.39::true_val(ownership_structure, unk_ownership_structure).

measured(s87, ownership_structure, private_donna_carpenter).

all_consistent(ownership_structure) :-
    consistent(s87, ownership_structure).

evidence(all_consistent(ownership_structure)).
query(true_val(ownership_structure, private_donna_carpenter)).
query(true_val(ownership_structure, unk_ownership_structure)).

% @attr market_share_estimate
% @type categorical
% @canonical false
% @original_name Burton estimated to hold 40-45% of the snowboarding market
% @values pct_40_45=40_to_45_percent unk_market_share_estimate=Unknown
% @importance 0.50

0.72::acc(s87, market_share_estimate).

0.61::true_val(market_share_estimate, pct_40_45); 0.39::true_val(market_share_estimate, unk_market_share_estimate).

measured(s87, market_share_estimate, pct_40_45).

all_consistent(market_share_estimate) :-
    consistent(s87, market_share_estimate).

evidence(all_consistent(market_share_estimate)).
query(true_val(market_share_estimate, pct_40_45)).
query(true_val(market_share_estimate, unk_market_share_estimate)).

% @attr manufacturing_location_current
% @type categorical
% @canonical true
% @original_name manufacturing_location_current
% @values china=China china_and_austria=China_and_Austria
% @importance 0.57

0.75::acc(s14, manufacturing_location_current).
0.65::acc(s84, manufacturing_location_current).
0.70::acc(s85, manufacturing_location_current).

0.50::true_val(manufacturing_location_current, china); 0.50::true_val(manufacturing_location_current, china_and_austria).

measured(s14, manufacturing_location_current, china).
measured(s84, manufacturing_location_current, china_and_austria).
measured(s85, manufacturing_location_current, china_and_austria).

all_consistent(manufacturing_location_current) :-
    (indep(s14), consistent(s14, manufacturing_location_current) ; \+indep(s14)),
    consistent(s84, manufacturing_location_current),
    consistent(s85, manufacturing_location_current).

evidence(all_consistent(manufacturing_location_current)).
query(true_val(manufacturing_location_current, china)).
query(true_val(manufacturing_location_current, china_and_austria)).

% @attr b_corp_certification
% @type categorical
% @canonical false
% @original_name Burton is a B-Corp certified company
% @values certified=B_Corp_certified unk_b_corp=Unknown
% @importance 0.35

0.88::acc(s6, b_corp_certification).

0.90::true_val(b_corp_certification, certified); 0.10::true_val(b_corp_certification, unk_b_corp).

measured(s6, b_corp_certification, certified).

all_consistent(b_corp_certification) :-
    consistent(s6, b_corp_certification).

evidence(all_consistent(b_corp_certification)).
query(true_val(b_corp_certification, certified)).
query(true_val(b_corp_certification, unk_b_corp)).

% @attr mpn
% @type categorical
% @canonical true
% @original_name MPN
% @values v302881=302881 unk_mpn=Unknown
% @importance 0.65

0.82::acc(s14, mpn).

0.50::true_val(mpn, v302881); 0.50::true_val(mpn, unk_mpn).

measured(s14, mpn, v302881).

all_consistent(mpn) :-
    (indep(s14), consistent(s14, mpn) ; \+indep(s14)).

evidence(all_consistent(mpn)).
query(true_val(mpn, v302881)).
query(true_val(mpn, unk_mpn)).

% @attr sku_merchant
% @type categorical
% @canonical false
% @original_name SKU (merchant-provided)
% @values v2294212a03rg54w=2294212A03RG54W unk_sku=Unknown
% @importance 0.85

0.95::acc(s_merchant, sku_merchant).

0.95::true_val(sku_merchant, v2294212a03rg54w); 0.05::true_val(sku_merchant, unk_sku).

measured(s_merchant, sku_merchant, v2294212a03rg54w).

all_consistent(sku_merchant) :-
    consistent(s_merchant, sku_merchant).

evidence(all_consistent(sku_merchant)).
query(true_val(sku_merchant, v2294212a03rg54w)).
query(true_val(sku_merchant, unk_sku)).

% @attr gender
% @type categorical
% @canonical true
% @original_name gender
% @values unisex=Unisex unk_gender=Unknown
% @importance 0.87

0.88::acc(s2, gender).
0.85::acc(s8, gender).
0.82::acc(s10, gender).

0.95::true_val(gender, unisex); 0.05::true_val(gender, unk_gender).

measured(s2, gender, unisex).
measured(s8, gender, unisex).
measured(s10, gender, unisex).

all_consistent(gender) :-
    (indep(s2), consistent(s2, gender) ; \+indep(s2)),
    (indep(s8), consistent(s8, gender) ; \+indep(s8)),
    (indep(s10), consistent(s10, gender) ; \+indep(s10)).

evidence(all_consistent(gender)).
query(true_val(gender, unisex)).
query(true_val(gender, unk_gender)).

% @attr design_inspiration
% @type categorical
% @canonical false
% @original_name Design inspiration
% @values terje_balance_90s=Named_after_Terje_Hakonsen_Balance_model_90s_Burton_shapes unk_design_inspiration=Unknown
% @importance 0.58

0.88::acc(s4, design_inspiration).

0.78::true_val(design_inspiration, terje_balance_90s); 0.22::true_val(design_inspiration, unk_design_inspiration).

measured(s4, design_inspiration, terje_balance_90s).

all_consistent(design_inspiration) :-
    consistent(s4, design_inspiration).

evidence(all_consistent(design_inspiration)).
query(true_val(design_inspiration, terje_balance_90s)).
query(true_val(design_inspiration, unk_design_inspiration)).

% @attr predecessor_model_name
% @type categorical
% @canonical true
% @original_name predecessor_model_name
% @values replaces_deep_free_thinker=Replaces_Deep_Thinker_and_Free_Thinker combines_deep_cartographer_custom=Combines_Deep_Thinker_Cartographer_original_Custom
% @importance 0.78

0.82::acc(s4, predecessor_model_name).
0.85::acc(s12, predecessor_model_name).

0.45::true_val(predecessor_model_name, replaces_deep_free_thinker); 0.55::true_val(predecessor_model_name, combines_deep_cartographer_custom).

measured(s4, predecessor_model_name, replaces_deep_free_thinker).
measured(s12, predecessor_model_name, combines_deep_cartographer_custom).

all_consistent(predecessor_model_name) :-
    consistent(s4, predecessor_model_name),
    consistent(s12, predecessor_model_name).

evidence(all_consistent(predecessor_model_name)).
query(true_val(predecessor_model_name, replaces_deep_free_thinker)).
query(true_val(predecessor_model_name, combines_deep_cartographer_custom)).

% @attr design_philosophy
% @type categorical
% @canonical false
% @original_name Design philosophy
% @values quiver_killer=Quiver_killer_one_board_for_all unk_design_philosophy=Unknown
% @importance 0.88

0.88::acc(s2, design_philosophy).
0.85::acc(s9, design_philosophy).

0.95::true_val(design_philosophy, quiver_killer); 0.05::true_val(design_philosophy, unk_design_philosophy).

measured(s2, design_philosophy, quiver_killer).
measured(s9, design_philosophy, quiver_killer).

all_consistent(design_philosophy) :-
    (indep(s2), consistent(s2, design_philosophy) ; \+indep(s2)),
    consistent(s9, design_philosophy).

evidence(all_consistent(design_philosophy)).
query(true_val(design_philosophy, quiver_killer)).
query(true_val(design_philosophy, unk_design_philosophy)).

% @attr shape
% @type categorical
% @canonical true
% @original_name shape
% @values tapered_directional=Tapered_Directional unk_shape=Unknown
% @importance 0.85

0.92::acc(s_merchant, shape).
0.85::acc(s9, shape).
0.88::acc(s2, shape).
0.85::acc(s30, shape).

0.95::true_val(shape, tapered_directional); 0.05::true_val(shape, unk_shape).

measured(s_merchant, shape, tapered_directional).
measured(s9, shape, tapered_directional).
measured(s2, shape, tapered_directional).
measured(s30, shape, tapered_directional).

all_consistent(shape) :-
    (indep(s_merchant), consistent(s_merchant, shape) ; \+indep(s_merchant)),
    consistent(s9, shape),
    (indep(s2), consistent(s2, shape) ; \+indep(s2)),
    (indep(s30), consistent(s30, shape) ; \+indep(s30)).

evidence(all_consistent(shape)).
query(true_val(shape, tapered_directional)).
query(true_val(shape, unk_shape)).

% @attr taper
% @type numeric
% @unit mm
% @canonical true
% @original_name taper
% @values v8=8.0 unk_taper=Unknown
% @importance 0.83

0.93::acc(s4, taper).
0.85::acc(s8, taper).
0.95::acc(s6, taper).

0.95::true_val(taper, v8); 0.05::true_val(taper, unk_taper).

measured(s4, taper, v8).
measured(s8, taper, v8).
measured(s6, taper, v8).

all_consistent(taper) :-
    consistent(s4, taper),
    (indep(s8), consistent(s8, taper) ; \+indep(s8)),
    consistent(s6, taper).

evidence(all_consistent(taper)).
query(true_val(taper, v8)).
query(true_val(taper, unk_taper)).

% @attr camber_type
% @type categorical
% @canonical true
% @original_name camber_type
% @values directional_camber=Directional_Camber unk_camber_type=Unknown
% @importance 0.88

0.92::acc(s_merchant, camber_type).
0.90::acc(s2, camber_type).

0.95::true_val(camber_type, directional_camber); 0.05::true_val(camber_type, unk_camber_type).

measured(s_merchant, camber_type, directional_camber).
measured(s2, camber_type, directional_camber).

all_consistent(camber_type) :-
    (indep(s_merchant), consistent(s_merchant, camber_type) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, camber_type) ; \+indep(s2)).

evidence(all_consistent(camber_type)).
query(true_val(camber_type, directional_camber)).
query(true_val(camber_type, unk_camber_type)).

% @attr camber_description
% @type categorical
% @canonical false
% @original_name camber_description
% @values camber_underfoot_rockered_nose=Camber_under_feet_rockered_nose_for_float unk_camber_description=Unknown
% @importance 0.83

0.88::acc(s2, camber_description).
0.85::acc(s30, camber_description).

0.95::true_val(camber_description, camber_underfoot_rockered_nose); 0.05::true_val(camber_description, unk_camber_description).

measured(s2, camber_description, camber_underfoot_rockered_nose).
measured(s30, camber_description, camber_underfoot_rockered_nose).

all_consistent(camber_description) :-
    (indep(s2), consistent(s2, camber_description) ; \+indep(s2)),
    (indep(s30), consistent(s30, camber_description) ; \+indep(s30)).

evidence(all_consistent(camber_description)).
query(true_val(camber_description, camber_underfoot_rockered_nose)).
query(true_val(camber_description, unk_camber_description)).

% @attr flex_rating_10
% @type numeric
% @unit /10
% @canonical true
% @original_name flex_rating_10
% @values v6_5=6.5 v8=8.0
% @importance 0.83

0.90::acc(s_merchant, flex_rating_10).
0.85::acc(s68, flex_rating_10).
0.68::acc(s18, flex_rating_10).

0.70::true_val(flex_rating_10, v6_5); 0.30::true_val(flex_rating_10, v8).

measured(s_merchant, flex_rating_10, v6_5).
measured(s68, flex_rating_10, v6_5).
measured(s18, flex_rating_10, v8).

all_consistent(flex_rating_10) :-
    (indep(s_merchant), consistent(s_merchant, flex_rating_10) ; \+indep(s_merchant)),
    (indep(s68), consistent(s68, flex_rating_10) ; \+indep(s68)),
    consistent(s18, flex_rating_10).

evidence(all_consistent(flex_rating_10)).
query(true_val(flex_rating_10, v6_5)).
query(true_val(flex_rating_10, v8)).

% @attr flex_rating_10_manufacturer
% @type categorical
% @canonical false
% @original_name flex_rating_10_manufacturer
% @values medium_aggressive=Medium_aggressive unk_flex_mfr=Unknown
% @importance 0.80

0.85::acc(s8, flex_rating_10_manufacturer).

0.68::true_val(flex_rating_10_manufacturer, medium_aggressive); 0.32::true_val(flex_rating_10_manufacturer, unk_flex_mfr).

measured(s8, flex_rating_10_manufacturer, medium_aggressive).

all_consistent(flex_rating_10_manufacturer) :-
    (indep(s8), consistent(s8, flex_rating_10_manufacturer) ; \+indep(s8)).

evidence(all_consistent(flex_rating_10_manufacturer)).
query(true_val(flex_rating_10_manufacturer, medium_aggressive)).
query(true_val(flex_rating_10_manufacturer, unk_flex_mfr)).

% @attr flex_direction
% @type categorical
% @canonical true
% @original_name flex_direction
% @values directional_flex=Directional_Flex_increased_pop_tail_stiffer_nose unk_flex_direction=Unknown
% @importance 0.83

0.90::acc(s_merchant, flex_direction).
0.85::acc(s30, flex_direction).

0.95::true_val(flex_direction, directional_flex); 0.05::true_val(flex_direction, unk_flex_direction).

measured(s_merchant, flex_direction, directional_flex).
measured(s30, flex_direction, directional_flex).

all_consistent(flex_direction) :-
    (indep(s_merchant), consistent(s_merchant, flex_direction) ; \+indep(s_merchant)),
    (indep(s30), consistent(s30, flex_direction) ; \+indep(s30)).

evidence(all_consistent(flex_direction)).
query(true_val(flex_direction, directional_flex)).
query(true_val(flex_direction, unk_flex_direction)).

% @attr flex_pattern
% @type categorical
% @canonical false
% @original_name Flex pattern
% @values squeezebox=Squeezebox_profiled_core_sections unk_flex_pattern=Unknown
% @importance 0.82

0.90::acc(s_merchant, flex_pattern).
0.85::acc(s8, flex_pattern).
0.88::acc(s29, flex_pattern).

0.95::true_val(flex_pattern, squeezebox); 0.05::true_val(flex_pattern, unk_flex_pattern).

measured(s_merchant, flex_pattern, squeezebox).
measured(s8, flex_pattern, squeezebox).
measured(s29, flex_pattern, squeezebox).

all_consistent(flex_pattern) :-
    (indep(s_merchant), consistent(s_merchant, flex_pattern) ; \+indep(s_merchant)),
    (indep(s8), consistent(s8, flex_pattern) ; \+indep(s8)),
    (indep(s29), consistent(s29, flex_pattern) ; \+indep(s29)).

evidence(all_consistent(flex_pattern)).
query(true_val(flex_pattern, squeezebox)).
query(true_val(flex_pattern, unk_flex_pattern)).

% @attr flex_rating_10_the_good_ride
% @type categorical
% @canonical false
% @original_name flex_rating_10_the_good_ride
% @values medium=Medium_flex_moderate_buttering unk_flex_tgr=Unknown
% @importance 0.90

0.85::acc(s12, flex_rating_10_the_good_ride).

0.78::true_val(flex_rating_10_the_good_ride, medium); 0.22::true_val(flex_rating_10_the_good_ride, unk_flex_tgr).

measured(s12, flex_rating_10_the_good_ride, medium).

all_consistent(flex_rating_10_the_good_ride) :-
    consistent(s12, flex_rating_10_the_good_ride).

evidence(all_consistent(flex_rating_10_the_good_ride)).
query(true_val(flex_rating_10_the_good_ride, medium)).
query(true_val(flex_rating_10_the_good_ride, unk_flex_tgr)).

% @attr flex_feel
% @type categorical
% @canonical true
% @original_name flex_feel
% @values stiff_tail_softer_nose=Stiff_tail_to_front_inserts_softer_nose_rocker unk_flex_feel=Unknown
% @importance 0.90

0.85::acc(s12, flex_feel).

0.78::true_val(flex_feel, stiff_tail_softer_nose); 0.22::true_val(flex_feel, unk_flex_feel).

measured(s12, flex_feel, stiff_tail_softer_nose).

all_consistent(flex_feel) :-
    consistent(s12, flex_feel).

evidence(all_consistent(flex_feel)).
query(true_val(flex_feel, stiff_tail_softer_nose)).
query(true_val(flex_feel, unk_flex_feel)).

% @attr core_material
% @type categorical
% @canonical true
% @original_name core_material
% @values super_fly_ii_700g=Super_Fly_II_700G_dual_species_wood unk_core_material=Unknown
% @importance 0.83

0.92::acc(s_merchant, core_material).
0.87::acc(s9, core_material).
0.90::acc(s2, core_material).
0.82::acc(s10, core_material).

0.95::true_val(core_material, super_fly_ii_700g); 0.05::true_val(core_material, unk_core_material).

measured(s_merchant, core_material, super_fly_ii_700g).
measured(s9, core_material, super_fly_ii_700g).
measured(s2, core_material, super_fly_ii_700g).
measured(s10, core_material, super_fly_ii_700g).

all_consistent(core_material) :-
    (indep(s_merchant), consistent(s_merchant, core_material) ; \+indep(s_merchant)),
    consistent(s9, core_material),
    (indep(s2), consistent(s2, core_material) ; \+indep(s2)),
    (indep(s10), consistent(s10, core_material) ; \+indep(s10)).

evidence(all_consistent(core_material)).
query(true_val(core_material, super_fly_ii_700g)).
query(true_val(core_material, unk_core_material)).

% @attr construction_material_innovation
% @type categorical
% @canonical true
% @original_name construction_material_innovation
% @values dualzone_egd=Dualzone_EGD_engineered_grain_direction unk_cmi=Unknown
% @importance 0.78

0.90::acc(s_merchant, construction_material_innovation).
0.86::acc(s29, construction_material_innovation).
0.82::acc(s63, construction_material_innovation).

0.95::true_val(construction_material_innovation, dualzone_egd); 0.05::true_val(construction_material_innovation, unk_cmi).

measured(s_merchant, construction_material_innovation, dualzone_egd).
measured(s29, construction_material_innovation, dualzone_egd).
measured(s63, construction_material_innovation, dualzone_egd).

all_consistent(construction_material_innovation) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation) ; \+indep(s_merchant)),
    (indep(s29), consistent(s29, construction_material_innovation) ; \+indep(s29)),
    (indep(s63), consistent(s63, construction_material_innovation) ; \+indep(s63)).

evidence(all_consistent(construction_material_innovation)).
query(true_val(construction_material_innovation, dualzone_egd)).
query(true_val(construction_material_innovation, unk_cmi)).

% @attr construction_material_innovation_squeezebox
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values squeezebox_tech=Squeezebox_thicker_stiffer_outside_bindings_thinner_underfoot unk_cmi_sq=Unknown
% @importance 0.78

0.90::acc(s_merchant, construction_material_innovation_squeezebox).
0.85::acc(s8, construction_material_innovation_squeezebox).
0.86::acc(s29, construction_material_innovation_squeezebox).

0.95::true_val(construction_material_innovation_squeezebox, squeezebox_tech); 0.05::true_val(construction_material_innovation_squeezebox, unk_cmi_sq).

measured(s_merchant, construction_material_innovation_squeezebox, squeezebox_tech).
measured(s8, construction_material_innovation_squeezebox, squeezebox_tech).
measured(s29, construction_material_innovation_squeezebox, squeezebox_tech).

all_consistent(construction_material_innovation_squeezebox) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_squeezebox) ; \+indep(s_merchant)),
    (indep(s8), consistent(s8, construction_material_innovation_squeezebox) ; \+indep(s8)),
    (indep(s29), consistent(s29, construction_material_innovation_squeezebox) ; \+indep(s29)).

evidence(all_consistent(construction_material_innovation_squeezebox)).
query(true_val(construction_material_innovation_squeezebox, squeezebox_tech)).
query(true_val(construction_material_innovation_squeezebox, unk_cmi_sq)).

% @attr laminate
% @type categorical
% @canonical true
% @original_name laminate
% @values carbon_highlights_45=45_degree_Carbon_Highlights_tip_to_tail unk_laminate=Unknown
% @importance 0.67

0.90::acc(s_merchant, laminate).
0.85::acc(s4, laminate).
0.82::acc(s63, laminate).

0.95::true_val(laminate, carbon_highlights_45); 0.05::true_val(laminate, unk_laminate).

measured(s_merchant, laminate, carbon_highlights_45).
measured(s4, laminate, carbon_highlights_45).
measured(s63, laminate, carbon_highlights_45).

all_consistent(laminate) :-
    (indep(s_merchant), consistent(s_merchant, laminate) ; \+indep(s_merchant)),
    consistent(s4, laminate),
    (indep(s63), consistent(s63, laminate) ; \+indep(s63)).

evidence(all_consistent(laminate)).
query(true_val(laminate, carbon_highlights_45)).
query(true_val(laminate, unk_laminate)).

% @attr resin
% @type categorical
% @canonical true
% @original_name resin
% @values super_sap_epoxy=Super_Sap_Epoxy_bio_based_50pct_less_carbon unk_resin=Unknown
% @importance 0.82

0.90::acc(s_merchant, resin).
0.88::acc(s2, resin).
0.86::acc(s29, resin).

0.95::true_val(resin, super_sap_epoxy); 0.05::true_val(resin, unk_resin).

measured(s_merchant, resin, super_sap_epoxy).
measured(s2, resin, super_sap_epoxy).
measured(s29, resin, super_sap_epoxy).

all_consistent(resin) :-
    (indep(s_merchant), consistent(s_merchant, resin) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, resin) ; \+indep(s2)),
    (indep(s29), consistent(s29, resin) ; \+indep(s29)).

evidence(all_consistent(resin)).
query(true_val(resin, super_sap_epoxy)).
query(true_val(resin, unk_resin)).

% @attr base_material
% @type categorical
% @canonical true
% @original_name base_material
% @values sintered_wfo=Sintered_WFO_high_density_wax_infused unk_base_material=Unknown
% @importance 0.85

0.92::acc(s_merchant, base_material).
0.90::acc(s2, base_material).
0.88::acc(s29, base_material).

0.95::true_val(base_material, sintered_wfo); 0.05::true_val(base_material, unk_base_material).

measured(s_merchant, base_material, sintered_wfo).
measured(s2, base_material, sintered_wfo).
measured(s29, base_material, sintered_wfo).

all_consistent(base_material) :-
    (indep(s_merchant), consistent(s_merchant, base_material) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, base_material) ; \+indep(s2)),
    (indep(s29), consistent(s29, base_material) ; \+indep(s29)).

evidence(all_consistent(base_material)).
query(true_val(base_material, sintered_wfo)).
query(true_val(base_material, unk_base_material)).

% @attr base_glide_performance
% @type categorical
% @canonical true
% @original_name base_glide_performance
% @values good_not_amazing=Good_not_amazing_but_better_than_past unk_base_glide=Unknown
% @importance 0.90

0.87::acc(s12, base_glide_performance).

0.78::true_val(base_glide_performance, good_not_amazing); 0.22::true_val(base_glide_performance, unk_base_glide).

measured(s12, base_glide_performance, good_not_amazing).

all_consistent(base_glide_performance) :-
    consistent(s12, base_glide_performance).

evidence(all_consistent(base_glide_performance)).
query(true_val(base_glide_performance, good_not_amazing)).
query(true_val(base_glide_performance, unk_base_glide)).

% @attr edge_technology
% @type categorical
% @canonical true
% @original_name edge_technology
% @values frostbite_edges=Frostbite_Edges_extended_beneath_bindings unk_edge_tech=Unknown
% @importance 0.80

0.90::acc(s_merchant, edge_technology).
0.85::acc(s8, edge_technology).
0.88::acc(s29, edge_technology).

0.95::true_val(edge_technology, frostbite_edges); 0.05::true_val(edge_technology, unk_edge_tech).

measured(s_merchant, edge_technology, frostbite_edges).
measured(s8, edge_technology, frostbite_edges).
measured(s29, edge_technology, frostbite_edges).

all_consistent(edge_technology) :-
    (indep(s_merchant), consistent(s_merchant, edge_technology) ; \+indep(s_merchant)),
    (indep(s8), consistent(s8, edge_technology) ; \+indep(s8)),
    (indep(s29), consistent(s29, edge_technology) ; \+indep(s29)).

evidence(all_consistent(edge_technology)).
query(true_val(edge_technology, frostbite_edges)).
query(true_val(edge_technology, unk_edge_tech)).

% @attr construction_material_innovation_pro_tip
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values pro_tip=Pro_Tip_tapered_tip_tail_reduces_swing_weight unk_cmi_pt=Unknown
% @importance 0.78

0.90::acc(s_merchant, construction_material_innovation_pro_tip).
0.86::acc(s29, construction_material_innovation_pro_tip).
0.82::acc(s63, construction_material_innovation_pro_tip).

0.95::true_val(construction_material_innovation_pro_tip, pro_tip); 0.05::true_val(construction_material_innovation_pro_tip, unk_cmi_pt).

measured(s_merchant, construction_material_innovation_pro_tip, pro_tip).
measured(s29, construction_material_innovation_pro_tip, pro_tip).
measured(s63, construction_material_innovation_pro_tip, pro_tip).

all_consistent(construction_material_innovation_pro_tip) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_pro_tip) ; \+indep(s_merchant)),
    (indep(s29), consistent(s29, construction_material_innovation_pro_tip) ; \+indep(s29)),
    (indep(s63), consistent(s63, construction_material_innovation_pro_tip) ; \+indep(s63)).

evidence(all_consistent(construction_material_innovation_pro_tip)).
query(true_val(construction_material_innovation_pro_tip, pro_tip)).
query(true_val(construction_material_innovation_pro_tip, unk_cmi_pt)).

% @attr construction_material_innovation_infinite_ride
% @type categorical
% @canonical false
% @original_name construction_material_innovation
% @values infinite_ride=Infinite_Ride_factory_overbuilt_then_broken_down unk_cmi_ir=Unknown
% @importance 0.82

0.90::acc(s_merchant, construction_material_innovation_infinite_ride).
0.88::acc(s2, construction_material_innovation_infinite_ride).
0.86::acc(s29, construction_material_innovation_infinite_ride).

0.95::true_val(construction_material_innovation_infinite_ride, infinite_ride); 0.05::true_val(construction_material_innovation_infinite_ride, unk_cmi_ir).

measured(s_merchant, construction_material_innovation_infinite_ride, infinite_ride).
measured(s2, construction_material_innovation_infinite_ride, infinite_ride).
measured(s29, construction_material_innovation_infinite_ride, infinite_ride).

all_consistent(construction_material_innovation_infinite_ride) :-
    (indep(s_merchant), consistent(s_merchant, construction_material_innovation_infinite_ride) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, construction_material_innovation_infinite_ride) ; \+indep(s2)),
    (indep(s29), consistent(s29, construction_material_innovation_infinite_ride) ; \+indep(s29)).

evidence(all_consistent(construction_material_innovation_infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, infinite_ride)).
query(true_val(construction_material_innovation_infinite_ride, unk_cmi_ir)).

% @attr mounting_pattern
% @type categorical
% @canonical true
% @original_name mounting_pattern
% @values the_channel=The_Channel_Burton_all_major_bindings unk_mounting=Unknown
% @importance 0.85

0.92::acc(s_merchant, mounting_pattern).
0.90::acc(s2, mounting_pattern).
0.88::acc(s29, mounting_pattern).

0.95::true_val(mounting_pattern, the_channel); 0.05::true_val(mounting_pattern, unk_mounting).

measured(s_merchant, mounting_pattern, the_channel).
measured(s2, mounting_pattern, the_channel).
measured(s29, mounting_pattern, the_channel).

all_consistent(mounting_pattern) :-
    (indep(s_merchant), consistent(s_merchant, mounting_pattern) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, mounting_pattern) ; \+indep(s2)),
    (indep(s29), consistent(s29, mounting_pattern) ; \+indep(s29)).

evidence(all_consistent(mounting_pattern)).
query(true_val(mounting_pattern, the_channel)).
query(true_val(mounting_pattern, unk_mounting)).

% @attr binding_compatibility
% @type categorical
% @canonical true
% @original_name binding_compatibility
% @values channel_all_major=Channel_compatible_all_major_brands_EST_only_with_Channel unk_binding=Unknown
% @importance 0.83

0.88::acc(s29, binding_compatibility).
0.85::acc(s30, binding_compatibility).
0.88::acc(s2, binding_compatibility).

0.95::true_val(binding_compatibility, channel_all_major); 0.05::true_val(binding_compatibility, unk_binding).

measured(s29, binding_compatibility, channel_all_major).
measured(s30, binding_compatibility, channel_all_major).
measured(s2, binding_compatibility, channel_all_major).

all_consistent(binding_compatibility) :-
    (indep(s29), consistent(s29, binding_compatibility) ; \+indep(s29)),
    (indep(s30), consistent(s30, binding_compatibility) ; \+indep(s30)),
    (indep(s2), consistent(s2, binding_compatibility) ; \+indep(s2)).

evidence(all_consistent(binding_compatibility)).
query(true_val(binding_compatibility, channel_all_major)).
query(true_val(binding_compatibility, unk_binding)).

% @attr available_sizes
% @type categorical
% @canonical true
% @original_name available_sizes
% @values full_range=142_146_150_154_154W_158_158W_162_162W unk_sizes=Unknown
% @importance 0.85

0.90::acc(s9, available_sizes).
0.92::acc(s_merchant, available_sizes).

0.95::true_val(available_sizes, full_range); 0.05::true_val(available_sizes, unk_sizes).

measured(s9, available_sizes, full_range).
measured(s_merchant, available_sizes, full_range).

all_consistent(available_sizes) :-
    consistent(s9, available_sizes),
    (indep(s_merchant), consistent(s_merchant, available_sizes) ; \+indep(s_merchant)).

evidence(all_consistent(available_sizes)).
query(true_val(available_sizes, full_range)).
query(true_val(available_sizes, unk_sizes)).

% @attr width_options
% @type categorical
% @canonical true
% @original_name width_options
% @values standard_and_wide=Standard_and_Wide unk_width_options=Unknown
% @importance 0.83

0.92::acc(s_merchant, width_options).
0.82::acc(s68, width_options).

0.95::true_val(width_options, standard_and_wide); 0.05::true_val(width_options, unk_width_options).

measured(s_merchant, width_options, standard_and_wide).
measured(s68, width_options, standard_and_wide).

all_consistent(width_options) :-
    (indep(s_merchant), consistent(s_merchant, width_options) ; \+indep(s_merchant)),
    (indep(s68), consistent(s68, width_options) ; \+indep(s68)).

evidence(all_consistent(width_options)).
query(true_val(width_options, standard_and_wide)).
query(true_val(width_options, unk_width_options)).

% @attr setback
% @type numeric
% @unit cm
% @canonical true
% @original_name setback
% @values v_neg2_5=neg2.5 unk_setback=Unknown
% @importance 0.85

0.92::acc(s_merchant, setback).

0.95::true_val(setback, v_neg2_5); 0.05::true_val(setback, unk_setback).

measured(s_merchant, setback, v_neg2_5).

all_consistent(setback) :-
    (indep(s_merchant), consistent(s_merchant, setback) ; \+indep(s_merchant)).

evidence(all_consistent(setback)).
query(true_val(setback, v_neg2_5)).
query(true_val(setback, unk_setback)).

% @attr setback_tgr_22in
% @type categorical
% @canonical false
% @original_name setback
% @values one_inch_back_sidecut_two_back_board=1in_back_sidecut_2in_back_board_at_22in_stance unk_setback_22=Unknown
% @importance 0.90

0.83::acc(s12, setback_tgr_22in).

0.78::true_val(setback_tgr_22in, one_inch_back_sidecut_two_back_board); 0.22::true_val(setback_tgr_22in, unk_setback_22).

measured(s12, setback_tgr_22in, one_inch_back_sidecut_two_back_board).

all_consistent(setback_tgr_22in) :-
    consistent(s12, setback_tgr_22in).

evidence(all_consistent(setback_tgr_22in)).
query(true_val(setback_tgr_22in, one_inch_back_sidecut_two_back_board)).
query(true_val(setback_tgr_22in, unk_setback_22)).

% @attr setback_tgr_23in
% @type categorical
% @canonical false
% @original_name setback
% @values three_five_in_back=3_5in_back_from_center_at_23in_stance unk_setback_23=Unknown
% @importance 0.90

0.83::acc(s12, setback_tgr_23in).

0.78::true_val(setback_tgr_23in, three_five_in_back); 0.22::true_val(setback_tgr_23in, unk_setback_23).

measured(s12, setback_tgr_23in, three_five_in_back).

all_consistent(setback_tgr_23in) :-
    consistent(s12, setback_tgr_23in).

evidence(all_consistent(setback_tgr_23in)).
query(true_val(setback_tgr_23in, three_five_in_back)).
query(true_val(setback_tgr_23in, unk_setback_23)).

% @attr size_spec_confirmation
% @type categorical
% @canonical false
% @original_name All detailed size-specific measurements confirmed as manufacturer specs
% @values confirmed=Confirmed_manufacturer_specs unk_size_spec=Unknown
% @importance 0.85

0.92::acc(s_merchant, size_spec_confirmation).

0.95::true_val(size_spec_confirmation, confirmed); 0.05::true_val(size_spec_confirmation, unk_size_spec).

measured(s_merchant, size_spec_confirmation, confirmed).

all_consistent(size_spec_confirmation) :-
    (indep(s_merchant), consistent(s_merchant, size_spec_confirmation) ; \+indep(s_merchant)).

evidence(all_consistent(size_spec_confirmation)).
query(true_val(size_spec_confirmation, confirmed)).
query(true_val(size_spec_confirmation, unk_size_spec)).

% @attr terrain_park_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v6=6.0 unk_terrain_park=Unknown
% @importance 0.83

0.90::acc(s_merchant, terrain_park_10).
0.78::acc(s18, terrain_park_10).

0.95::true_val(terrain_park_10, v6); 0.05::true_val(terrain_park_10, unk_terrain_park).

measured(s_merchant, terrain_park_10, v6).
measured(s18, terrain_park_10, v6).

all_consistent(terrain_park_10) :-
    (indep(s_merchant), consistent(s_merchant, terrain_park_10) ; \+indep(s_merchant)),
    consistent(s18, terrain_park_10).

evidence(all_consistent(terrain_park_10)).
query(true_val(terrain_park_10, v6)).
query(true_val(terrain_park_10, unk_terrain_park)).

% @attr terrain_all_mountain_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v8=8.0 unk_terrain_am=Unknown
% @importance 0.83

0.90::acc(s_merchant, terrain_all_mountain_10).
0.78::acc(s18, terrain_all_mountain_10).

0.95::true_val(terrain_all_mountain_10, v8); 0.05::true_val(terrain_all_mountain_10, unk_terrain_am).

measured(s_merchant, terrain_all_mountain_10, v8).
measured(s18, terrain_all_mountain_10, v8).

all_consistent(terrain_all_mountain_10) :-
    (indep(s_merchant), consistent(s_merchant, terrain_all_mountain_10) ; \+indep(s_merchant)),
    consistent(s18, terrain_all_mountain_10).

evidence(all_consistent(terrain_all_mountain_10)).
query(true_val(terrain_all_mountain_10, v8)).
query(true_val(terrain_all_mountain_10, unk_terrain_am)).

% @attr terrain_powder_10
% @type numeric
% @unit /10
% @canonical false
% @original_name terrain_suitability
% @values v7=7.0 unk_terrain_pow=Unknown
% @importance 0.83

0.90::acc(s_merchant, terrain_powder_10).
0.78::acc(s18, terrain_powder_10).

0.95::true_val(terrain_powder_10, v7); 0.05::true_val(terrain_powder_10, unk_terrain_pow).

measured(s_merchant, terrain_powder_10, v7).
measured(s18, terrain_powder_10, v7).

all_consistent(terrain_powder_10) :-
    (indep(s_merchant), consistent(s_merchant, terrain_powder_10) ; \+indep(s_merchant)),
    consistent(s18, terrain_powder_10).

evidence(all_consistent(terrain_powder_10)).
query(true_val(terrain_powder_10, v7)).
query(true_val(terrain_powder_10, unk_terrain_pow)).

% @attr skill_level_recommendation
% @type categorical
% @canonical true
% @original_name skill_level_recommendation
% @values intermediate=Intermediate intermediate_to_expert=Intermediate_to_Expert intermediate_advanced=Intermediate_Advanced expert=Expert
% @importance 0.83

0.88::acc(s_merchant, skill_level_recommendation).
0.72::acc(s18, skill_level_recommendation).
0.85::acc(s2, skill_level_recommendation).
0.80::acc(s29, skill_level_recommendation).

0.30::true_val(skill_level_recommendation, intermediate); 0.25::true_val(skill_level_recommendation, intermediate_to_expert); 0.30::true_val(skill_level_recommendation, intermediate_advanced); 0.15::true_val(skill_level_recommendation, expert).

measured(s_merchant, skill_level_recommendation, intermediate).
measured(s18, skill_level_recommendation, intermediate_to_expert).
measured(s2, skill_level_recommendation, intermediate_advanced).
measured(s29, skill_level_recommendation, expert).

all_consistent(skill_level_recommendation) :-
    (indep(s_merchant), consistent(s_merchant, skill_level_recommendation) ; \+indep(s_merchant)),
    consistent(s18, skill_level_recommendation),
    (indep(s2), consistent(s2, skill_level_recommendation) ; \+indep(s2)),
    (indep(s29), consistent(s29, skill_level_recommendation) ; \+indep(s29)).

evidence(all_consistent(skill_level_recommendation)).
query(true_val(skill_level_recommendation, intermediate)).
query(true_val(skill_level_recommendation, intermediate_to_expert)).
query(true_val(skill_level_recommendation, intermediate_advanced)).
query(true_val(skill_level_recommendation, expert)).

% @attr terrain_suitability
% @type categorical
% @canonical true
% @original_name terrain_suitability
% @values all_terrain=Fresh_snow_groomers_off_piste_side_hits_park unk_terrain=Unknown
% @importance 0.88

0.90::acc(s_merchant, terrain_suitability).
0.88::acc(s2, terrain_suitability).
0.85::acc(s9, terrain_suitability).

0.95::true_val(terrain_suitability, all_terrain); 0.05::true_val(terrain_suitability, unk_terrain).

measured(s_merchant, terrain_suitability, all_terrain).
measured(s2, terrain_suitability, all_terrain).
measured(s9, terrain_suitability, all_terrain).

all_consistent(terrain_suitability) :-
    (indep(s_merchant), consistent(s_merchant, terrain_suitability) ; \+indep(s_merchant)),
    (indep(s2), consistent(s2, terrain_suitability) ; \+indep(s2)),
    consistent(s9, terrain_suitability).

evidence(all_consistent(terrain_suitability)).
query(true_val(terrain_suitability, all_terrain)).
query(true_val(terrain_suitability, unk_terrain)).

% @attr riding_style
% @type categorical
% @canonical true
% @original_name riding_style
% @values freeride=Freeride unk_riding_style=Unknown
% @importance 0.90

0.85::acc(s12, riding_style).

0.78::true_val(riding_style, freeride); 0.22::true_val(riding_style, unk_riding_style).

measured(s12, riding_style, freeride).

all_consistent(riding_style) :-
    consistent(s12, riding_style).

evidence(all_consistent(riding_style)).
query(true_val(riding_style, freeride)).
query(true_val(riding_style, unk_riding_style)).

% @attr terrain_suitability_tgr
% @type categorical
% @canonical false
% @original_name terrain_suitability
% @values all_conditions=All_conditions_variable_spring_hardpack_soft_snow unk_terrain_tgr=Unknown
% @importance 0.90

0.87::acc(s12, terrain_suitability_tgr).

0.78::true_val(terrain_suitability_tgr, all_conditions); 0.22::true_val(terrain_suitability_tgr, unk_terrain_tgr).

measured(s12, terrain_suitability_tgr, all_conditions).

all_consistent(terrain_suitability_tgr) :-
    consistent(s12, terrain_suitability_tgr).

evidence(all_consistent(terrain_suitability_tgr)).
query(true_val(terrain_suitability_tgr, all_conditions)).
query(true_val(terrain_suitability_tgr, unk_terrain_tgr)).

% @attr powder_rating_tgr
% @type categorical
% @canonical true
% @original_name powder_rating_tgr
% @values good=Good unk_powder_tgr=Unknown
% @importance 0.90

0.85::acc(s12, powder_rating_tgr).

0.78::true_val(powder_rating_tgr, good); 0.22::true_val(powder_rating_tgr, unk_powder_tgr).

measured(s12, powder_rating_tgr, good).

all_consistent(powder_rating_tgr) :-
    consistent(s12, powder_rating_tgr).

evidence(all_consistent(powder_rating_tgr)).
query(true_val(powder_rating_tgr, good)).
query(true_val(powder_rating_tgr, unk_powder_tgr)).

% @attr carving_rating_tgr
% @type categorical
% @canonical true
% @original_name carving_rating_tgr
% @values great=Great unk_carving_tgr=Unknown
% @importance 0.90

0.87::acc(s12, carving_rating_tgr).

0.78::true_val(carving_rating_tgr, great); 0.22::true_val(carving_rating_tgr, unk_carving_tgr).

measured(s12, carving_rating_tgr, great).

all_consistent(carving_rating_tgr) :-
    consistent(s12, carving_rating_tgr).

evidence(all_consistent(carving_rating_tgr)).
query(true_val(carving_rating_tgr, great)).
query(true_val(carving_rating_tgr, unk_carving_tgr)).

% @attr speed_rating_tgr
% @type categorical
% @canonical true
% @original_name speed_rating_tgr
% @values good=Good unk_speed_tgr=Unknown
% @importance 0.90

0.85::acc(s12, speed_rating_tgr).

0.78::true_val(speed_rating_tgr, good); 0.22::true_val(speed_rating_tgr, unk_speed_tgr).

measured(s12, speed_rating_tgr, good).

all_consistent(speed_rating_tgr) :-
    consistent(s12, speed_rating_tgr).

evidence(all_consistent(speed_rating_tgr)).
query(true_val(speed_rating_tgr, good)).
query(true_val(speed_rating_tgr, unk_speed_tgr)).

% @attr reviewer_opinion_the_good_ride
% @type categorical
% @canonical true
% @original_name reviewer_opinion_the_good_ride
% @values good=Good unk_tgr_opinion=Unknown
% @importance 0.90

0.85::acc(s12, reviewer_opinion_the_good_ride).

0.78::true_val(reviewer_opinion_the_good_ride, good); 0.22::true_val(reviewer_opinion_the_good_ride, unk_tgr_opinion).

measured(s12, reviewer_opinion_the_good_ride, good).

all_consistent(reviewer_opinion_the_good_ride) :-
    consistent(s12, reviewer_opinion_the_good_ride).

evidence(all_consistent(reviewer_opinion_the_good_ride)).
query(true_val(reviewer_opinion_the_good_ride, good)).
query(true_val(reviewer_opinion_the_good_ride, unk_tgr_opinion)).

% @attr switch_riding
% @type categorical
% @canonical true
% @original_name switch_riding
% @values good=Good unk_switch=Unknown
% @importance 0.90

0.83::acc(s12, switch_riding).

0.78::true_val(switch_riding, good); 0.22::true_val(switch_riding, unk_switch).

measured(s12, switch_riding, good).

all_consistent(switch_riding) :-
    consistent(s12, switch_riding).

evidence(all_consistent(switch_riding)).
query(true_val(switch_riding, good)).
query(true_val(switch_riding, unk_switch)).

% @attr jumps_rating_tgr
% @type categorical
% @canonical true
% @original_name jumps_rating_tgr
% @values great=Great unk_jumps_tgr=Unknown
% @importance 0.90

0.85::acc(s12, jumps_rating_tgr).

0.78::true_val(jumps_rating_tgr, great); 0.22::true_val(jumps_rating_tgr, unk_jumps_tgr).

measured(s12, jumps_rating_tgr, great).

all_consistent(jumps_rating_tgr) :-
    consistent(s12, jumps_rating_tgr).

evidence(all_consistent(jumps_rating_tgr)).
query(true_val(jumps_rating_tgr, great)).
query(true_val(jumps_rating_tgr, unk_jumps_tgr)).

% @attr jibbing_rating_tgr
% @type categorical
% @canonical true
% @original_name jibbing_rating_tgr
% @values average=Average unk_jibbing_tgr=Unknown
% @importance 0.90

0.83::acc(s12, jibbing_rating_tgr).

0.78::true_val(jibbing_rating_tgr, average); 0.22::true_val(jibbing_rating_tgr, unk_jibbing_tgr).

measured(s12, jibbing_rating_tgr, average).

all_consistent(jibbing_rating_tgr) :-
    consistent(s12, jibbing_rating_tgr).

evidence(all_consistent(jibbing_rating_tgr)).
query(true_val(jibbing_rating_tgr, average)).
query(true_val(jibbing_rating_tgr, unk_jibbing_tgr)).

% @attr pipe_rating_tgr
% @type categorical
% @canonical true
% @original_name pipe_rating_tgr
% @values great=Great unk_pipe_tgr=Unknown
% @importance 0.90

0.85::acc(s12, pipe_rating_tgr).

0.78::true_val(pipe_rating_tgr, great); 0.22::true_val(pipe_rating_tgr, unk_pipe_tgr).

measured(s12, pipe_rating_tgr, great).

all_consistent(pipe_rating_tgr) :-
    consistent(s12, pipe_rating_tgr).

evidence(all_consistent(pipe_rating_tgr)).
query(true_val(pipe_rating_tgr, great)).
query(true_val(pipe_rating_tgr, unk_pipe_tgr)).

% @attr on_snow_feel_tgr
% @type categorical
% @canonical true
% @original_name on_snow_feel_tgr
% @values stable=Stable unk_on_snow=Unknown
% @importance 0.90

0.87::acc(s12, on_snow_feel_tgr).

0.78::true_val(on_snow_feel_tgr, stable); 0.22::true_val(on_snow_feel_tgr, unk_on_snow).

measured(s12, on_snow_feel_tgr, stable).

all_consistent(on_snow_feel_tgr) :-
    consistent(s12, on_snow_feel_tgr).

evidence(all_consistent(on_snow_feel_tgr)).
query(true_val(on_snow_feel_tgr, stable)).
query(true_val(on_snow_feel_tgr, unk_on_snow)).

% @attr turn_initiation_performance
% @type categorical
% @canonical true
% @original_name turn_initiation_performance
% @values medium_fast=Medium_Fast unk_turn_init=Unknown
% @importance 0.90

0.85::acc(s12, turn_initiation_performance).

0.78::true_val(turn_initiation_performance, medium_fast); 0.22::true_val(turn_initiation_performance, unk_turn_init).

measured(s12, turn_initiation_performance, medium_fast).

all_consistent(turn_initiation_performance) :-
    consistent(s12, turn_initiation_performance).

evidence(all_consistent(turn_initiation_performance)).
query(true_val(turn_initiation_performance, medium_fast)).
query(true_val(turn_initiation_performance, unk_turn_init)).

% @attr reviewer_opinion_the_good_ride_buttering
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values moderate=Moderate unk_tgr_butter=Unknown
% @importance 0.90

0.82::acc(s12, reviewer_opinion_the_good_ride_buttering).

0.78::true_val(reviewer_opinion_the_good_ride_buttering, moderate); 0.22::true_val(reviewer_opinion_the_good_ride_buttering, unk_tgr_butter).

measured(s12, reviewer_opinion_the_good_ride_buttering, moderate).

all_consistent(reviewer_opinion_the_good_ride_buttering) :-
    consistent(s12, reviewer_opinion_the_good_ride_buttering).

evidence(all_consistent(reviewer_opinion_the_good_ride_buttering)).
query(true_val(reviewer_opinion_the_good_ride_buttering, moderate)).
query(true_val(reviewer_opinion_the_good_ride_buttering, unk_tgr_butter)).

% @attr edge_hold
% @type categorical
% @canonical true
% @original_name edge_hold
% @values hard_snow_better_than_most_burton=Hard_Snow_better_edge_hold_than_most_Burton unk_edge_hold=Unknown
% @importance 0.90

0.88::acc(s12, edge_hold).

0.78::true_val(edge_hold, hard_snow_better_than_most_burton); 0.22::true_val(edge_hold, unk_edge_hold).

measured(s12, edge_hold, hard_snow_better_than_most_burton).

all_consistent(edge_hold) :-
    consistent(s12, edge_hold).

evidence(all_consistent(edge_hold)).
query(true_val(edge_hold, hard_snow_better_than_most_burton)).
query(true_val(edge_hold, unk_edge_hold)).

% @attr reviewer_opinion_the_good_ride_weight
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values feels_normal=Feels_Normal_lighter_side_without_compromising unk_tgr_weight=Unknown
% @importance 0.90

0.83::acc(s12, reviewer_opinion_the_good_ride_weight).

0.78::true_val(reviewer_opinion_the_good_ride_weight, feels_normal); 0.22::true_val(reviewer_opinion_the_good_ride_weight, unk_tgr_weight).

measured(s12, reviewer_opinion_the_good_ride_weight, feels_normal).

all_consistent(reviewer_opinion_the_good_ride_weight) :-
    consistent(s12, reviewer_opinion_the_good_ride_weight).

evidence(all_consistent(reviewer_opinion_the_good_ride_weight)).
query(true_val(reviewer_opinion_the_good_ride_weight, feels_normal)).
query(true_val(reviewer_opinion_the_good_ride_weight, unk_tgr_weight)).

% @attr reviewer_opinion_whitelines
% @type categorical
% @canonical true
% @original_name reviewer_opinion_whitelines
% @values excellent=Excellent_piece_of_kit_freestyle_freeride_equilibrium unk_whitelines=Unknown
% @importance 0.70

0.85::acc(s4, reviewer_opinion_whitelines).

0.78::true_val(reviewer_opinion_whitelines, excellent); 0.22::true_val(reviewer_opinion_whitelines, unk_whitelines).

measured(s4, reviewer_opinion_whitelines, excellent).

all_consistent(reviewer_opinion_whitelines) :-
    consistent(s4, reviewer_opinion_whitelines).

evidence(all_consistent(reviewer_opinion_whitelines)).
query(true_val(reviewer_opinion_whitelines, excellent)).
query(true_val(reviewer_opinion_whitelines, unk_whitelines)).

% @attr reviewer_opinion_whitelines_edge
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values held_edge_incredibly_well=Held_edge_incredibly_well_not_twitchy unk_wl_edge=Unknown
% @importance 0.80

0.83::acc(s4, reviewer_opinion_whitelines_edge).

0.72::true_val(reviewer_opinion_whitelines_edge, held_edge_incredibly_well); 0.28::true_val(reviewer_opinion_whitelines_edge, unk_wl_edge).

measured(s4, reviewer_opinion_whitelines_edge, held_edge_incredibly_well).

all_consistent(reviewer_opinion_whitelines_edge) :-
    consistent(s4, reviewer_opinion_whitelines_edge).

evidence(all_consistent(reviewer_opinion_whitelines_edge)).
query(true_val(reviewer_opinion_whitelines_edge, held_edge_incredibly_well)).
query(true_val(reviewer_opinion_whitelines_edge, unk_wl_edge)).

% @attr reviewer_opinion_whitelines_flex
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values softer_for_freeride_lively=On_softer_side_for_freeride_lively_shape unk_wl_flex=Unknown
% @importance 0.80

0.83::acc(s4, reviewer_opinion_whitelines_flex).

0.72::true_val(reviewer_opinion_whitelines_flex, softer_for_freeride_lively); 0.28::true_val(reviewer_opinion_whitelines_flex, unk_wl_flex).

measured(s4, reviewer_opinion_whitelines_flex, softer_for_freeride_lively).

all_consistent(reviewer_opinion_whitelines_flex) :-
    consistent(s4, reviewer_opinion_whitelines_flex).

evidence(all_consistent(reviewer_opinion_whitelines_flex)).
query(true_val(reviewer_opinion_whitelines_flex, softer_for_freeride_lively)).
query(true_val(reviewer_opinion_whitelines_flex, unk_wl_flex)).

% @attr reviewer_opinion_the_good_ride_recommendation
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values highly_recommended=Will_be_recommending_a_lot unk_tgr_rec=Unknown
% @importance 0.88

0.87::acc(s12, reviewer_opinion_the_good_ride_recommendation).

0.78::true_val(reviewer_opinion_the_good_ride_recommendation, highly_recommended); 0.22::true_val(reviewer_opinion_the_good_ride_recommendation, unk_tgr_rec).

measured(s12, reviewer_opinion_the_good_ride_recommendation, highly_recommended).

all_consistent(reviewer_opinion_the_good_ride_recommendation) :-
    consistent(s12, reviewer_opinion_the_good_ride_recommendation).

evidence(all_consistent(reviewer_opinion_the_good_ride_recommendation)).
query(true_val(reviewer_opinion_the_good_ride_recommendation, highly_recommended)).
query(true_val(reviewer_opinion_the_good_ride_recommendation, unk_tgr_rec)).

% @attr positive_aspect
% @type categorical
% @canonical true
% @original_name positive_aspect
% @values edge_hold_pop_low_chatter_daily_driver=Better_edge_hold_excellent_pop_less_chatter_great_daily_driver unk_positive=Unknown
% @importance 0.90

0.87::acc(s12, positive_aspect).

0.78::true_val(positive_aspect, edge_hold_pop_low_chatter_daily_driver); 0.22::true_val(positive_aspect, unk_positive).

measured(s12, positive_aspect, edge_hold_pop_low_chatter_daily_driver).

all_consistent(positive_aspect) :-
    consistent(s12, positive_aspect).

evidence(all_consistent(positive_aspect)).
query(true_val(positive_aspect, edge_hold_pop_low_chatter_daily_driver)).
query(true_val(positive_aspect, unk_positive)).

% @attr negative_aspect
% @type categorical
% @canonical true
% @original_name negative_aspect
% @values set_back_wider_than_ref=Set_all_the_way_back_much_wider_than_reference unk_negative=Unknown
% @importance 0.90

0.82::acc(s12, negative_aspect).

0.78::true_val(negative_aspect, set_back_wider_than_ref); 0.22::true_val(negative_aspect, unk_negative).

measured(s12, negative_aspect, set_back_wider_than_ref).

all_consistent(negative_aspect) :-
    consistent(s12, negative_aspect).

evidence(all_consistent(negative_aspect)).
query(true_val(negative_aspect, set_back_wider_than_ref)).
query(true_val(negative_aspect, unk_negative)).

% @attr user_review_forum
% @type categorical
% @canonical true
% @original_name user_review_forum
% @values super_easy_to_ride=Super_easy_to_ride_felt_right_out_of_box unk_user_forum=Unknown
% @importance 0.80

0.80::acc(s9, user_review_forum).

0.63::true_val(user_review_forum, super_easy_to_ride); 0.37::true_val(user_review_forum, unk_user_forum).

measured(s9, user_review_forum, super_easy_to_ride).

all_consistent(user_review_forum) :-
    consistent(s9, user_review_forum).

evidence(all_consistent(user_review_forum)).
query(true_val(user_review_forum, super_easy_to_ride)).
query(true_val(user_review_forum, unk_user_forum)).

% @attr user_review_forum_edge_hold
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values solid_edge_hold_responsive=Super_solid_edge_hold_responsive_turn_to_turn unk_uf_edge=Unknown
% @importance 0.85

0.80::acc(s9, user_review_forum_edge_hold).

0.63::true_val(user_review_forum_edge_hold, solid_edge_hold_responsive); 0.37::true_val(user_review_forum_edge_hold, unk_uf_edge).

measured(s9, user_review_forum_edge_hold, solid_edge_hold_responsive).

all_consistent(user_review_forum_edge_hold) :-
    consistent(s9, user_review_forum_edge_hold).

evidence(all_consistent(user_review_forum_edge_hold)).
query(true_val(user_review_forum_edge_hold, solid_edge_hold_responsive)).
query(true_val(user_review_forum_edge_hold, unk_uf_edge)).

% @attr reviewer_opinion_the_good_ride_detailed
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values like_a_lot_good_camber_lightweight_poppy=Like_board_a_lot_camber_good_lightweight_poppy_not_chattery unk_tgr_detail=Unknown
% @importance 0.90

0.87::acc(s12, reviewer_opinion_the_good_ride_detailed).

0.78::true_val(reviewer_opinion_the_good_ride_detailed, like_a_lot_good_camber_lightweight_poppy); 0.22::true_val(reviewer_opinion_the_good_ride_detailed, unk_tgr_detail).

measured(s12, reviewer_opinion_the_good_ride_detailed, like_a_lot_good_camber_lightweight_poppy).

all_consistent(reviewer_opinion_the_good_ride_detailed) :-
    consistent(s12, reviewer_opinion_the_good_ride_detailed).

evidence(all_consistent(reviewer_opinion_the_good_ride_detailed)).
query(true_val(reviewer_opinion_the_good_ride_detailed, like_a_lot_good_camber_lightweight_poppy)).
query(true_val(reviewer_opinion_the_good_ride_detailed, unk_tgr_detail)).

% @attr negative_aspect_channel
% @type categorical
% @canonical false
% @original_name negative_aspect
% @values channel_system_criticism=Not_biggest_fan_of_channel_want_four_screws unk_neg_channel=Unknown
% @importance 0.90

0.80::acc(s12, negative_aspect_channel).

0.78::true_val(negative_aspect_channel, channel_system_criticism); 0.22::true_val(negative_aspect_channel, unk_neg_channel).

measured(s12, negative_aspect_channel, channel_system_criticism).

all_consistent(negative_aspect_channel) :-
    consistent(s12, negative_aspect_channel).

evidence(all_consistent(negative_aspect_channel)).
query(true_val(negative_aspect_channel, channel_system_criticism)).
query(true_val(negative_aspect_channel, unk_neg_channel)).

% @attr user_review_forum_vs_deep_thinker
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values dt_better_float_cb_better_ice=Deep_Thinker_better_float_Counterbalance_better_ice unk_uf_dt=Unknown
% @importance 0.80

0.62::acc(s43, user_review_forum_vs_deep_thinker).

0.31::true_val(user_review_forum_vs_deep_thinker, dt_better_float_cb_better_ice); 0.69::true_val(user_review_forum_vs_deep_thinker, unk_uf_dt).

measured(s43, user_review_forum_vs_deep_thinker, dt_better_float_cb_better_ice).

all_consistent(user_review_forum_vs_deep_thinker) :-
    consistent(s43, user_review_forum_vs_deep_thinker).

evidence(all_consistent(user_review_forum_vs_deep_thinker)).
query(true_val(user_review_forum_vs_deep_thinker, dt_better_float_cb_better_ice)).
query(true_val(user_review_forum_vs_deep_thinker, unk_uf_dt)).

% @attr user_review_forum_vs_hometown_hero
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values softer_than_hth=Counterbalance_seems_softer_than_Hometown_Hero unk_uf_hth=Unknown
% @importance 0.75

0.55::acc(s51, user_review_forum_vs_hometown_hero).

0.29::true_val(user_review_forum_vs_hometown_hero, softer_than_hth); 0.71::true_val(user_review_forum_vs_hometown_hero, unk_uf_hth).

measured(s51, user_review_forum_vs_hometown_hero, softer_than_hth).

all_consistent(user_review_forum_vs_hometown_hero) :-
    consistent(s51, user_review_forum_vs_hometown_hero).

evidence(all_consistent(user_review_forum_vs_hometown_hero)).
query(true_val(user_review_forum_vs_hometown_hero, softer_than_hth)).
query(true_val(user_review_forum_vs_hometown_hero, unk_uf_hth)).

% @attr user_review_forum_morzine
% @type categorical
% @canonical false
% @original_name user_review_forum
% @values sloppy_straight_lining_improved_set_back=Sloppy_straight_lining_improved_with_bindings_set_back unk_uf_morz=Unknown
% @importance 0.70

0.50::acc(s80, user_review_forum_morzine).

0.26::true_val(user_review_forum_morzine, sloppy_straight_lining_improved_set_back); 0.74::true_val(user_review_forum_morzine, unk_uf_morz).

measured(s80, user_review_forum_morzine, sloppy_straight_lining_improved_set_back).

all_consistent(user_review_forum_morzine) :-
    consistent(s80, user_review_forum_morzine).

evidence(all_consistent(user_review_forum_morzine)).
query(true_val(user_review_forum_morzine, sloppy_straight_lining_improved_set_back)).
query(true_val(user_review_forum_morzine, unk_uf_morz)).

% @attr reviewer_opinion_the_good_ride_speed_limit
% @type categorical
% @canonical false
% @original_name reviewer_opinion_the_good_ride
% @values not_full_bomber_high_fidelity_faster=Not_full_bomber_High_Fidelity_for_speed unk_tgr_speed=Unknown
% @importance 0.88

0.85::acc(s12, reviewer_opinion_the_good_ride_speed_limit).

0.78::true_val(reviewer_opinion_the_good_ride_speed_limit, not_full_bomber_high_fidelity_faster); 0.22::true_val(reviewer_opinion_the_good_ride_speed_limit, unk_tgr_speed).

measured(s12, reviewer_opinion_the_good_ride_speed_limit, not_full_bomber_high_fidelity_faster).

all_consistent(reviewer_opinion_the_good_ride_speed_limit) :-
    consistent(s12, reviewer_opinion_the_good_ride_speed_limit).

evidence(all_consistent(reviewer_opinion_the_good_ride_speed_limit)).
query(true_val(reviewer_opinion_the_good_ride_speed_limit, not_full_bomber_high_fidelity_faster)).
query(true_val(reviewer_opinion_the_good_ride_speed_limit, unk_tgr_speed)).

% @attr comparable_board_cross_brand
% @type categorical
% @canonical true
% @original_name comparable_board_cross_brand
% @values amplid_k2_us_jones_sal_stranda_yes=Amplid_Souly_Grail_K2_Alchemist_US_Cadet_Jones_Flagship_Pro_etc unk_comparable=Unknown
% @importance 0.90

0.85::acc(s12, comparable_board_cross_brand).

0.78::true_val(comparable_board_cross_brand, amplid_k2_us_jones_sal_stranda_yes); 0.22::true_val(comparable_board_cross_brand, unk_comparable).

measured(s12, comparable_board_cross_brand, amplid_k2_us_jones_sal_stranda_yes).

all_consistent(comparable_board_cross_brand) :-
    consistent(s12, comparable_board_cross_brand).

evidence(all_consistent(comparable_board_cross_brand)).
query(true_val(comparable_board_cross_brand, amplid_k2_us_jones_sal_stranda_yes)).
query(true_val(comparable_board_cross_brand, unk_comparable)).

% @attr reviewer_opinion_whitelines_award
% @type categorical
% @canonical false
% @original_name reviewer_opinion_whitelines
% @values awarded_recognition=Board_awarded_recognition_testers_loved_it unk_wl_award=Unknown
% @importance 0.55

0.75::acc(s4, reviewer_opinion_whitelines_award).

0.45::true_val(reviewer_opinion_whitelines_award, awarded_recognition); 0.55::true_val(reviewer_opinion_whitelines_award, unk_wl_award).

measured(s4, reviewer_opinion_whitelines_award, awarded_recognition).

all_consistent(reviewer_opinion_whitelines_award) :-
    consistent(s4, reviewer_opinion_whitelines_award).

evidence(all_consistent(reviewer_opinion_whitelines_award)).
query(true_val(reviewer_opinion_whitelines_award, awarded_recognition)).
query(true_val(reviewer_opinion_whitelines_award, unk_wl_award)).

% @attr price_usd_msrp
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_msrp
% @values v659_95=659.95 unk_msrp=Unknown
% @importance 0.83

0.82::acc(s42, price_usd_msrp).
0.88::acc(s8, price_usd_msrp).
0.85::acc(s10, price_usd_msrp).

0.95::true_val(price_usd_msrp, v659_95); 0.05::true_val(price_usd_msrp, unk_msrp).

measured(s42, price_usd_msrp, v659_95).
measured(s8, price_usd_msrp, v659_95).
measured(s10, price_usd_msrp, v659_95).

all_consistent(price_usd_msrp) :-
    (indep(s42), consistent(s42, price_usd_msrp) ; \+indep(s42)),
    (indep(s8), consistent(s8, price_usd_msrp) ; \+indep(s8)),
    (indep(s10), consistent(s10, price_usd_msrp) ; \+indep(s10)).

evidence(all_consistent(price_usd_msrp)).
query(true_val(price_usd_msrp, v659_95)).
query(true_val(price_usd_msrp, unk_msrp)).

% @attr price_usd_peter_glenn
% @type numeric
% @unit USD
% @canonical false
% @original_name US sale price at Peter Glenn
% @values v459_99=459.99 unk_price_pg=Unknown
% @importance 0.90

0.90::acc(s8, price_usd_peter_glenn).

0.69::true_val(price_usd_peter_glenn, v459_99); 0.31::true_val(price_usd_peter_glenn, unk_price_pg).

measured(s8, price_usd_peter_glenn, v459_99).

all_consistent(price_usd_peter_glenn) :-
    consistent(s8, price_usd_peter_glenn).

evidence(all_consistent(price_usd_peter_glenn)).
query(true_val(price_usd_peter_glenn, v459_99)).
query(true_val(price_usd_peter_glenn, unk_price_pg)).

% @attr price_usd_evo
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_evo
% @values v419_99=419.99 unk_price_evo=Unknown
% @importance 0.90

0.88::acc(s12, price_usd_evo).

0.78::true_val(price_usd_evo, v419_99); 0.22::true_val(price_usd_evo, unk_price_evo).

measured(s12, price_usd_evo, v419_99).

all_consistent(price_usd_evo) :-
    consistent(s12, price_usd_evo).

evidence(all_consistent(price_usd_evo)).
query(true_val(price_usd_evo, v419_99)).
query(true_val(price_usd_evo, unk_price_evo)).

% @attr price_usd_blauer
% @type numeric
% @unit USD
% @canonical false
% @original_name US price at Blauer Board Shop
% @values v659=659.0 unk_price_blauer=Unknown
% @importance 0.90

0.85::acc(s12, price_usd_blauer).

0.78::true_val(price_usd_blauer, v659); 0.22::true_val(price_usd_blauer, unk_price_blauer).

measured(s12, price_usd_blauer, v659).

all_consistent(price_usd_blauer) :-
    consistent(s12, price_usd_blauer).

evidence(all_consistent(price_usd_blauer)).
query(true_val(price_usd_blauer, v659)).
query(true_val(price_usd_blauer, unk_price_blauer)).

% @attr price_usd_sun_ski
% @type numeric
% @unit USD
% @canonical false
% @original_name US price at Sun & Ski Sports
% @values v527_93=527.93 unk_price_sunski=Unknown
% @importance 0.90

0.85::acc(s12, price_usd_sun_ski).

0.78::true_val(price_usd_sun_ski, v527_93); 0.22::true_val(price_usd_sun_ski, unk_price_sunski).

measured(s12, price_usd_sun_ski, v527_93).

all_consistent(price_usd_sun_ski) :-
    consistent(s12, price_usd_sun_ski).

evidence(all_consistent(price_usd_sun_ski)).
query(true_val(price_usd_sun_ski, v527_93)).
query(true_val(price_usd_sun_ski, unk_price_sunski)).

% @attr price_usd_tactics
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_tactics
% @values v461_95=461.95 unk_price_tactics=Unknown
% @importance 0.90

0.85::acc(s12, price_usd_tactics).

0.78::true_val(price_usd_tactics, v461_95); 0.22::true_val(price_usd_tactics, unk_price_tactics).

measured(s12, price_usd_tactics, v461_95).

all_consistent(price_usd_tactics) :-
    consistent(s12, price_usd_tactics).

evidence(all_consistent(price_usd_tactics)).
query(true_val(price_usd_tactics, v461_95)).
query(true_val(price_usd_tactics, unk_price_tactics)).

% @attr price_usd_backcountry
% @type numeric
% @unit USD
% @canonical true
% @original_name price_usd_backcountry
% @values v395_97=395.97 unk_price_bc=Unknown
% @importance 0.90

0.85::acc(s12, price_usd_backcountry).

0.78::true_val(price_usd_backcountry, v395_97); 0.22::true_val(price_usd_backcountry, unk_price_bc).

measured(s12, price_usd_backcountry, v395_97).

all_consistent(price_usd_backcountry) :-
    consistent(s12, price_usd_backcountry).

evidence(all_consistent(price_usd_backcountry)).
query(true_val(price_usd_backcountry, v395_97)).
query(true_val(price_usd_backcountry, unk_price_bc)).

% @attr price_usd_ski_bum
% @type numeric
% @unit USD
% @canonical false
% @original_name US price at The Ski Bum
% @values v527_96=527.96 unk_price_skibum=Unknown
% @importance 0.80

0.82::acc(s97, price_usd_ski_bum).

0.54::true_val(price_usd_ski_bum, v527_96); 0.46::true_val(price_usd_ski_bum, unk_price_skibum).

measured(s97, price_usd_ski_bum, v527_96).

all_consistent(price_usd_ski_bum) :-
    consistent(s97, price_usd_ski_bum).

evidence(all_consistent(price_usd_ski_bum)).
query(true_val(price_usd_ski_bum, v527_96)).
query(true_val(price_usd_ski_bum, unk_price_skibum)).

% @attr price_usd_arlberg
% @type numeric
% @unit USD
% @canonical false
% @original_name US price at Arlberg Ski
% @values v659_95=659.95 unk_price_arlberg=Unknown
% @importance 0.80

0.85::acc(s42, price_usd_arlberg).

0.53::true_val(price_usd_arlberg, v659_95); 0.47::true_val(price_usd_arlberg, unk_price_arlberg).

measured(s42, price_usd_arlberg, v659_95).

all_consistent(price_usd_arlberg) :-
    consistent(s42, price_usd_arlberg).

evidence(all_consistent(price_usd_arlberg)).
query(true_val(price_usd_arlberg, v659_95)).
query(true_val(price_usd_arlberg, unk_price_arlberg)).

% @attr price_aud_merchant
% @type numeric
% @unit AUD
% @canonical true
% @original_name price_aud_merchant
% @values v759_99=759.99 unk_price_aud=Unknown
% @importance 0.85

0.95::acc(s_merchant, price_aud_merchant).

0.95::true_val(price_aud_merchant, v759_99); 0.05::true_val(price_aud_merchant, unk_price_aud).

measured(s_merchant, price_aud_merchant, v759_99).

all_consistent(price_aud_merchant) :-
    consistent(s_merchant, price_aud_merchant).

evidence(all_consistent(price_aud_merchant)).
query(true_val(price_aud_merchant, v759_99)).
query(true_val(price_aud_merchant, unk_price_aud)).

% @attr price_cad_burton
% @type numeric
% @unit CAD
% @canonical false
% @original_name CAD price at Burton Canada
% @values v839_99=839.99 unk_price_cad_burton=Unknown
% @importance 0.90

0.85::acc(s12, price_cad_burton).

0.78::true_val(price_cad_burton, v839_99); 0.22::true_val(price_cad_burton, unk_price_cad_burton).

measured(s12, price_cad_burton, v839_99).

all_consistent(price_cad_burton) :-
    consistent(s12, price_cad_burton).

evidence(all_consistent(price_cad_burton)).
query(true_val(price_cad_burton, v839_99)).
query(true_val(price_cad_burton, unk_price_cad_burton)).

% @attr price_cad_prfo
% @type numeric
% @unit CAD
% @canonical true
% @original_name price_cad_prfo
% @values v587_99=587.99 unk_price_prfo=Unknown
% @importance 0.90

0.85::acc(s12, price_cad_prfo).

0.78::true_val(price_cad_prfo, v587_99); 0.22::true_val(price_cad_prfo, unk_price_prfo).

measured(s12, price_cad_prfo, v587_99).

all_consistent(price_cad_prfo) :-
    consistent(s12, price_cad_prfo).

evidence(all_consistent(price_cad_prfo)).
query(true_val(price_cad_prfo, v587_99)).
query(true_val(price_cad_prfo, unk_price_prfo)).

% @attr price_eur_blue_tomato
% @type numeric
% @unit EUR
% @canonical true
% @original_name price_eur_blue_tomato
% @values v599=599.0 unk_price_bt=Unknown
% @importance 0.90

0.85::acc(s12, price_eur_blue_tomato).

0.78::true_val(price_eur_blue_tomato, v599); 0.22::true_val(price_eur_blue_tomato, unk_price_bt).

measured(s12, price_eur_blue_tomato, v599).

all_consistent(price_eur_blue_tomato) :-
    consistent(s12, price_eur_blue_tomato).

evidence(all_consistent(price_eur_blue_tomato)).
query(true_val(price_eur_blue_tomato, v599)).
query(true_val(price_eur_blue_tomato, unk_price_bt)).

% @attr price_eur_snowcountry
% @type numeric
% @unit EUR
% @canonical false
% @original_name EUR price at SnowCountry
% @values v499=499.0 unk_price_sc=Unknown
% @importance 0.90

0.85::acc(s12, price_eur_snowcountry).

0.78::true_val(price_eur_snowcountry, v499); 0.22::true_val(price_eur_snowcountry, unk_price_sc).

measured(s12, price_eur_snowcountry, v499).

all_consistent(price_eur_snowcountry) :-
    consistent(s12, price_eur_snowcountry).

evidence(all_consistent(price_eur_snowcountry)).
query(true_val(price_eur_snowcountry, v499)).
query(true_val(price_eur_snowcountry, unk_price_sc)).

% @attr price_eur_zezula
% @type numeric
% @unit EUR
% @canonical false
% @original_name EUR price at Snowboard Zezula
% @values v537_90=537.90 unk_price_zez=Unknown
% @importance 0.60

0.88::acc(s7, price_eur_zezula).

0.71::true_val(price_eur_zezula, v537_90); 0.29::true_val(price_eur_zezula, unk_price_zez).

measured(s7, price_eur_zezula, v537_90).

all_consistent(price_eur_zezula) :-
    consistent(s7, price_eur_zezula).

evidence(all_consistent(price_eur_zezula)).
query(true_val(price_eur_zezula, v537_90)).
query(true_val(price_eur_zezula, unk_price_zez)).

% @attr price_usd_evo_full
% @type numeric
% @unit USD
% @canonical false
% @original_name price_usd_evo
% @values v659_95=659.95 unk_price_evo_full=Unknown
% @importance 0.80

0.85::acc(s4, price_usd_evo_full).

0.70::true_val(price_usd_evo_full, v659_95); 0.30::true_val(price_usd_evo_full, unk_price_evo_full).

measured(s4, price_usd_evo_full, v659_95).

all_consistent(price_usd_evo_full) :-
    consistent(s4, price_usd_evo_full).

evidence(all_consistent(price_usd_evo_full)).
query(true_val(price_usd_evo_full, v659_95)).
query(true_val(price_usd_evo_full, unk_price_evo_full)).

% @attr availability_status
% @type categorical
% @canonical true
% @original_name availability_status
% @values in_stock=In_stock unk_availability=Unknown
% @importance 0.75

0.88::acc(s2, availability_status).

0.70::true_val(availability_status, in_stock); 0.30::true_val(availability_status, unk_availability).

measured(s2, availability_status, in_stock).

all_consistent(availability_status) :-
    consistent(s2, availability_status).

evidence(all_consistent(availability_status)).
query(true_val(availability_status, in_stock)).
query(true_val(availability_status, unk_availability)).

% @attr availability_status_pathfinder
% @type categorical
% @canonical false
% @original_name availability_status
% @values in_stock_free_shipping=In_stock_free_shipping unk_avail_pf=Unknown
% @importance 0.80

0.85::acc(s10, availability_status_pathfinder).

0.56::true_val(availability_status_pathfinder, in_stock_free_shipping); 0.44::true_val(availability_status_pathfinder, unk_avail_pf).

measured(s10, availability_status_pathfinder, in_stock_free_shipping).

all_consistent(availability_status_pathfinder) :-
    consistent(s10, availability_status_pathfinder).

evidence(all_consistent(availability_status_pathfinder)).
query(true_val(availability_status_pathfinder, in_stock_free_shipping)).
query(true_val(availability_status_pathfinder, unk_avail_pf)).

% @attr availability_status_melbourne
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_au_only=Available_ships_within_Australia_only unk_avail_melb=Unknown
% @importance 0.75

0.82::acc(s63, availability_status_melbourne).

0.60::true_val(availability_status_melbourne, available_au_only); 0.40::true_val(availability_status_melbourne, unk_avail_melb).

measured(s63, availability_status_melbourne, available_au_only).

all_consistent(availability_status_melbourne) :-
    consistent(s63, availability_status_melbourne).

evidence(all_consistent(availability_status_melbourne)).
query(true_val(availability_status_melbourne, available_au_only)).
query(true_val(availability_status_melbourne, unk_avail_melb)).

% @attr availability_status_balmoral
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_10_flat_rate=Available_10_dollar_flat_rate_shipping_AU unk_avail_balm=Unknown
% @importance 0.80

0.82::acc(s64, availability_status_balmoral).

0.57::true_val(availability_status_balmoral, available_10_flat_rate); 0.43::true_val(availability_status_balmoral, unk_avail_balm).

measured(s64, availability_status_balmoral, available_10_flat_rate).

all_consistent(availability_status_balmoral) :-
    consistent(s64, availability_status_balmoral).

evidence(all_consistent(availability_status_balmoral)).
query(true_val(availability_status_balmoral, available_10_flat_rate)).
query(true_val(availability_status_balmoral, unk_avail_balm)).

% @attr availability_status_trojan
% @type categorical
% @canonical false
% @original_name availability_status
% @values sold_out_vineyard_available_rockdale=Sold_out_Vineyard_available_Rockdale unk_avail_troj=Unknown
% @importance 0.80

0.80::acc(s68, availability_status_trojan).

0.50::true_val(availability_status_trojan, sold_out_vineyard_available_rockdale); 0.50::true_val(availability_status_trojan, unk_avail_troj).

measured(s68, availability_status_trojan, sold_out_vineyard_available_rockdale).

all_consistent(availability_status_trojan) :-
    consistent(s68, availability_status_trojan).

evidence(all_consistent(availability_status_trojan)).
query(true_val(availability_status_trojan, sold_out_vineyard_available_rockdale)).
query(true_val(availability_status_trojan, unk_avail_troj)).

% @attr availability_status_free_ship_99
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_free_ship_over_99=Available_free_shipping_over_99 unk_avail_fs=Unknown
% @importance 0.75

0.75::acc(s10, availability_status_free_ship_99).

0.56::true_val(availability_status_free_ship_99, available_free_ship_over_99); 0.44::true_val(availability_status_free_ship_99, unk_avail_fs).

measured(s10, availability_status_free_ship_99, available_free_ship_over_99).

all_consistent(availability_status_free_ship_99) :-
    consistent(s10, availability_status_free_ship_99).

evidence(all_consistent(availability_status_free_ship_99)).
query(true_val(availability_status_free_ship_99, available_free_ship_over_99)).
query(true_val(availability_status_free_ship_99, unk_avail_fs)).

% @attr availability_status_ebay
% @type categorical
% @canonical false
% @original_name availability_status
% @values available_free_ship_canada=Available_ASOGEAR_free_shipping_Canada unk_avail_ebay=Unknown
% @importance 0.70

0.78::acc(s14, availability_status_ebay).

0.47::true_val(availability_status_ebay, available_free_ship_canada); 0.53::true_val(availability_status_ebay, unk_avail_ebay).

measured(s14, availability_status_ebay, available_free_ship_canada).

all_consistent(availability_status_ebay) :-
    (indep(s14), consistent(s14, availability_status_ebay) ; \+indep(s14)).

evidence(all_consistent(availability_status_ebay)).
query(true_val(availability_status_ebay, available_free_ship_canada)).
query(true_val(availability_status_ebay, unk_avail_ebay)).

% @attr shipping_restriction_merchant
% @type categorical
% @canonical false
% @original_name Shipping restriction (merchant)
% @values australia_only=Australia_only unk_ship_restrict=Unknown
% @importance 0.85

0.95::acc(s_merchant, shipping_restriction_merchant).

0.95::true_val(shipping_restriction_merchant, australia_only); 0.05::true_val(shipping_restriction_merchant, unk_ship_restrict).

measured(s_merchant, shipping_restriction_merchant, australia_only).

all_consistent(shipping_restriction_merchant) :-
    consistent(s_merchant, shipping_restriction_merchant).

evidence(all_consistent(shipping_restriction_merchant)).
query(true_val(shipping_restriction_merchant, australia_only)).
query(true_val(shipping_restriction_merchant, unk_ship_restrict)).

% @attr evo_reputation
% @type categorical
% @canonical false
% @original_name evo reputation
% @values established_major_retailer=Established_major_retailer_free_ship_price_beat_1yr_return unk_evo_rep=Unknown
% @importance 0.70

0.85::acc(s2, evo_reputation).

0.70::true_val(evo_reputation, established_major_retailer); 0.30::true_val(evo_reputation, unk_evo_rep).

measured(s2, evo_reputation, established_major_retailer).

all_consistent(evo_reputation) :-
    consistent(s2, evo_reputation).

evidence(all_consistent(evo_reputation)).
query(true_val(evo_reputation, established_major_retailer)).
query(true_val(evo_reputation, unk_evo_rep)).

% @attr peter_glenn_reputation
% @type categorical
% @canonical false
% @original_name Peter Glenn reputation
% @values established_us_specialty=Established_US_ski_snowboard_specialty_retailer unk_pg_rep=Unknown
% @importance 0.90

0.82::acc(s8, peter_glenn_reputation).

0.69::true_val(peter_glenn_reputation, established_us_specialty); 0.31::true_val(peter_glenn_reputation, unk_pg_rep).

measured(s8, peter_glenn_reputation, established_us_specialty).

all_consistent(peter_glenn_reputation) :-
    consistent(s8, peter_glenn_reputation).

evidence(all_consistent(peter_glenn_reputation)).
query(true_val(peter_glenn_reputation, established_us_specialty)).
query(true_val(peter_glenn_reputation, unk_pg_rep)).

% @attr tactics_reputation
% @type categorical
% @canonical false
% @original_name Tactics reputation
% @values established_us_specialty=Established_US_snowboard_specialty_retailer unk_tact_rep=Unknown
% @importance 0.85

0.82::acc(s29, tactics_reputation).

0.72::true_val(tactics_reputation, established_us_specialty); 0.28::true_val(tactics_reputation, unk_tact_rep).

measured(s29, tactics_reputation, established_us_specialty).

all_consistent(tactics_reputation) :-
    consistent(s29, tactics_reputation).

evidence(all_consistent(tactics_reputation)).
query(true_val(tactics_reputation, established_us_specialty)).
query(true_val(tactics_reputation, unk_tact_rep)).

% @attr backcountry_reputation
% @type categorical
% @canonical false
% @original_name Backcountry reputation
% @values major_us_outdoor=Major_US_outdoor_retailer unk_bc_rep=Unknown
% @importance 0.90

0.85::acc(s12, backcountry_reputation).

0.78::true_val(backcountry_reputation, major_us_outdoor); 0.22::true_val(backcountry_reputation, unk_bc_rep).

measured(s12, backcountry_reputation, major_us_outdoor).

all_consistent(backcountry_reputation) :-
    consistent(s12, backcountry_reputation).

evidence(all_consistent(backcountry_reputation)).
query(true_val(backcountry_reputation, major_us_outdoor)).
query(true_val(backcountry_reputation, unk_bc_rep)).

% @attr ebay_seller_reputation
% @type categorical
% @canonical false
% @original_name eBay seller (ASOGEAR) reputation
% @values positive_99_1_pct=99_1_percent_positive_190K_sold unk_ebay_rep=Unknown
% @importance 0.65

0.78::acc(s14, ebay_seller_reputation).

0.50::true_val(ebay_seller_reputation, positive_99_1_pct); 0.50::true_val(ebay_seller_reputation, unk_ebay_rep).

measured(s14, ebay_seller_reputation, positive_99_1_pct).

all_consistent(ebay_seller_reputation) :-
    consistent(s14, ebay_seller_reputation).

evidence(all_consistent(ebay_seller_reputation)).
query(true_val(ebay_seller_reputation, positive_99_1_pct)).
query(true_val(ebay_seller_reputation, unk_ebay_rep)).

% @attr blauer_board_shop_reputation
% @type categorical
% @canonical false
% @original_name Blauer Board Shop reputation
% @values recommended_by_tgr=Recommended_by_TGR_supports_honest_reviews unk_blauer_rep=Unknown
% @importance 0.90

0.85::acc(s12, blauer_board_shop_reputation).

0.78::true_val(blauer_board_shop_reputation, recommended_by_tgr); 0.22::true_val(blauer_board_shop_reputation, unk_blauer_rep).

measured(s12, blauer_board_shop_reputation, recommended_by_tgr).

all_consistent(blauer_board_shop_reputation) :-
    consistent(s12, blauer_board_shop_reputation).

evidence(all_consistent(blauer_board_shop_reputation)).
query(true_val(blauer_board_shop_reputation, recommended_by_tgr)).
query(true_val(blauer_board_shop_reputation, unk_blauer_rep)).

% @attr snowboard_zezula_reputation
% @type categorical
% @canonical false
% @original_name Snowboard Zezula reputation
% @values european_specialist=European_specialist_snowboard_retailer unk_zez_rep=Unknown
% @importance 0.60

0.80::acc(s7, snowboard_zezula_reputation).

0.71::true_val(snowboard_zezula_reputation, european_specialist); 0.29::true_val(snowboard_zezula_reputation, unk_zez_rep).

measured(s7, snowboard_zezula_reputation, european_specialist).

all_consistent(snowboard_zezula_reputation) :-
    consistent(s7, snowboard_zezula_reputation).

evidence(all_consistent(snowboard_zezula_reputation)).
query(true_val(snowboard_zezula_reputation, european_specialist)).
query(true_val(snowboard_zezula_reputation, unk_zez_rep)).

% @attr melbourne_snowboard_reputation
% @type categorical
% @canonical false
% @original_name Melbourne Snowboard Centre reputation
% @values australian_specialist=Australian_specialist_retailer unk_melb_rep=Unknown
% @importance 0.75

0.82::acc(s63, melbourne_snowboard_reputation).

0.60::true_val(melbourne_snowboard_reputation, australian_specialist); 0.40::true_val(melbourne_snowboard_reputation, unk_melb_rep).

measured(s63, melbourne_snowboard_reputation, australian_specialist).

all_consistent(melbourne_snowboard_reputation) :-
    consistent(s63, melbourne_snowboard_reputation).

evidence(all_consistent(melbourne_snowboard_reputation)).
query(true_val(melbourne_snowboard_reputation, australian_specialist)).
query(true_val(melbourne_snowboard_reputation, unk_melb_rep)).

% @attr darkside_snowboards_reputation
% @type categorical
% @canonical false
% @original_name Darkside Snowboards reputation
% @values vermont_est_1989=Vermont_retailer_established_1989 unk_dark_rep=Unknown
% @importance 0.80

0.82::acc(s30, darkside_snowboards_reputation).

0.65::true_val(darkside_snowboards_reputation, vermont_est_1989); 0.35::true_val(darkside_snowboards_reputation, unk_dark_rep).

measured(s30, darkside_snowboards_reputation, vermont_est_1989).

all_consistent(darkside_snowboards_reputation) :-
    consistent(s30, darkside_snowboards_reputation).

evidence(all_consistent(darkside_snowboards_reputation)).
query(true_val(darkside_snowboards_reputation, vermont_est_1989)).
query(true_val(darkside_snowboards_reputation, unk_dark_rep)).

% @attr balmoral_boards_reputation
% @type categorical
% @canonical false
% @original_name Balmoral Boards (AU)
% @values au_specialist_30day_returns=Australian_specialist_30_day_returns unk_balm_rep=Unknown
% @importance 0.80

0.80::acc(s64, balmoral_boards_reputation).

0.57::true_val(balmoral_boards_reputation, au_specialist_30day_returns); 0.43::true_val(balmoral_boards_reputation, unk_balm_rep).

measured(s64, balmoral_boards_reputation, au_specialist_30day_returns).

all_consistent(balmoral_boards_reputation) :-
    consistent(s64, balmoral_boards_reputation).

evidence(all_consistent(balmoral_boards_reputation)).
query(true_val(balmoral_boards_reputation, au_specialist_30day_returns)).
query(true_val(balmoral_boards_reputation, unk_balm_rep)).

% @attr warranty_period_years
% @type numeric
% @unit years
% @canonical true
% @original_name warranty_period_years
% @values v3=3.0 unk_warranty_period=Unknown
% @importance 0.83

0.95::acc(s54, warranty_period_years).
0.95::acc(s55, warranty_period_years).
0.82::acc(s59, warranty_period_years).

0.95::true_val(warranty_period_years, v3); 0.05::true_val(warranty_period_years, unk_warranty_period).

measured(s54, warranty_period_years, v3).
measured(s55, warranty_period_years, v3).
measured(s59, warranty_period_years, v3).

all_consistent(warranty_period_years) :-
    consistent(s54, warranty_period_years),
    consistent(s55, warranty_period_years),
    (indep(s59), consistent(s59, warranty_period_years) ; \+indep(s59)).

evidence(all_consistent(warranty_period_years)).
query(true_val(warranty_period_years, v3)).
query(true_val(warranty_period_years, unk_warranty_period)).

% @attr warranty_original_purchaser
% @type categorical
% @canonical false
% @original_name Warranty applies to original purchaser only with proof of purchase from authorized dealer
% @values original_purchaser_only=Original_purchaser_only_proof_authorized_dealer unk_war_purch=Unknown
% @importance 0.78

0.93::acc(s53, warranty_original_purchaser).
0.95::acc(s55, warranty_original_purchaser).

0.95::true_val(warranty_original_purchaser, original_purchaser_only); 0.05::true_val(warranty_original_purchaser, unk_war_purch).

measured(s53, warranty_original_purchaser, original_purchaser_only).
measured(s55, warranty_original_purchaser, original_purchaser_only).

all_consistent(warranty_original_purchaser) :-
    consistent(s53, warranty_original_purchaser),
    consistent(s55, warranty_original_purchaser).

evidence(all_consistent(warranty_original_purchaser)).
query(true_val(warranty_original_purchaser, original_purchaser_only)).
query(true_val(warranty_original_purchaser, unk_war_purch)).

% @attr warranty
% @type categorical
% @canonical true
% @original_name warranty
% @values repair_or_replace=Repair_or_replacement_at_Burton_discretion unk_warranty=Unknown
% @importance 0.78

0.93::acc(s53, warranty).
0.95::acc(s54, warranty).

0.95::true_val(warranty, repair_or_replace); 0.05::true_val(warranty, unk_warranty).

measured(s53, warranty, repair_or_replace).
measured(s54, warranty, repair_or_replace).

all_consistent(warranty) :-
    consistent(s53, warranty),
    consistent(s54, warranty).

evidence(all_consistent(warranty)).
query(true_val(warranty, repair_or_replace)).
query(true_val(warranty, unk_warranty)).

% @attr warranty_exclusions
% @type categorical
% @canonical false
% @original_name warranty
% @values impact_abuse_misuse_wear=Impact_damage_abuse_misuse_normal_wear_excluded unk_war_excl=Unknown
% @importance 0.83

0.86::acc(s29, warranty_exclusions).
0.95::acc(s54, warranty_exclusions).

0.95::true_val(warranty_exclusions, impact_abuse_misuse_wear); 0.05::true_val(warranty_exclusions, unk_war_excl).

measured(s29, warranty_exclusions, impact_abuse_misuse_wear).
measured(s54, warranty_exclusions, impact_abuse_misuse_wear).

all_consistent(warranty_exclusions) :-
    (indep(s29), consistent(s29, warranty_exclusions) ; \+indep(s29)),
    consistent(s54, warranty_exclusions).

evidence(all_consistent(warranty_exclusions)).
query(true_val(warranty_exclusions, impact_abuse_misuse_wear)).
query(true_val(warranty_exclusions, unk_war_excl)).

% @attr warranty_ebay_excluded
% @type categorical
% @canonical false
% @original_name warranty
% @values ebay_no_warranty=Products_on_eBay_no_warranty unk_war_ebay=Unknown
% @importance 0.85

0.95::acc(s54, warranty_ebay_excluded).

0.90::true_val(warranty_ebay_excluded, ebay_no_warranty); 0.10::true_val(warranty_ebay_excluded, unk_war_ebay).

measured(s54, warranty_ebay_excluded, ebay_no_warranty).

all_consistent(warranty_ebay_excluded) :-
    consistent(s54, warranty_ebay_excluded).

evidence(all_consistent(warranty_ebay_excluded)).
query(true_val(warranty_ebay_excluded, ebay_no_warranty)).
query(true_val(warranty_ebay_excluded, unk_war_ebay)).

% @attr warranty_repair_time
% @type categorical
% @canonical false
% @original_name warranty
% @values three_to_four_weeks=Typically_3_4_weeks_longer_peak_season unk_war_time=Unknown
% @importance 0.70

0.90::acc(s53, warranty_repair_time).

0.84::true_val(warranty_repair_time, three_to_four_weeks); 0.16::true_val(warranty_repair_time, unk_war_time).

measured(s53, warranty_repair_time, three_to_four_weeks).

all_consistent(warranty_repair_time) :-
    consistent(s53, warranty_repair_time).

evidence(all_consistent(warranty_repair_time)).
query(true_val(warranty_repair_time, three_to_four_weeks)).
query(true_val(warranty_repair_time, unk_war_time)).

% @attr warranty_australian_law
% @type categorical
% @canonical false
% @original_name warranty
% @values acl_additional=Additional_guarantees_under_Australian_Consumer_Law unk_war_acl=Unknown
% @importance 0.85

0.93::acc(s60, warranty_australian_law).

0.90::true_val(warranty_australian_law, acl_additional); 0.10::true_val(warranty_australian_law, unk_war_acl).

measured(s60, warranty_australian_law, acl_additional).

all_consistent(warranty_australian_law) :-
    consistent(s60, warranty_australian_law).

evidence(all_consistent(warranty_australian_law)).
query(true_val(warranty_australian_law, acl_additional)).
query(true_val(warranty_australian_law, unk_war_acl)).

% @attr sustainability_certification
% @type categorical
% @canonical true
% @original_name sustainability_certification
% @values reduces_co2_50pct=Reduces_carbon_footprint_50pct_vs_petroleum unk_sustain=Unknown
% @importance 0.80

0.88::acc(s2, sustainability_certification).
0.86::acc(s29, sustainability_certification).
0.82::acc(s63, sustainability_certification).

0.95::true_val(sustainability_certification, reduces_co2_50pct); 0.05::true_val(sustainability_certification, unk_sustain).

measured(s2, sustainability_certification, reduces_co2_50pct).
measured(s29, sustainability_certification, reduces_co2_50pct).
measured(s63, sustainability_certification, reduces_co2_50pct).

all_consistent(sustainability_certification) :-
    (indep(s2), consistent(s2, sustainability_certification) ; \+indep(s2)),
    (indep(s29), consistent(s29, sustainability_certification) ; \+indep(s29)),
    (indep(s63), consistent(s63, sustainability_certification) ; \+indep(s63)).

evidence(all_consistent(sustainability_certification)).
query(true_val(sustainability_certification, reduces_co2_50pct)).
query(true_val(sustainability_certification, unk_sustain)).

% @attr sustainability_certification_oil
% @type categorical
% @canonical false
% @original_name sustainability_certification
% @values less_oil=Less_oil_consumption_per_board unk_sustain_oil=Unknown
% @importance 0.90

0.85::acc(s2, sustainability_certification_oil).

0.78::true_val(sustainability_certification_oil, less_oil); 0.22::true_val(sustainability_certification_oil, unk_sustain_oil).

measured(s2, sustainability_certification_oil, less_oil).

all_consistent(sustainability_certification_oil) :-
    (indep(s2), consistent(s2, sustainability_certification_oil) ; \+indep(s2)).

evidence(all_consistent(sustainability_certification_oil)).
query(true_val(sustainability_certification_oil, less_oil)).
query(true_val(sustainability_certification_oil, unk_sustain_oil)).

% @attr boot_size_rec_150
% @type categorical
% @canonical false
% @original_name Boot size rec 150
% @values us6_7=US_6_7 unk_boot_150=Unknown
% @importance 0.90

0.85::acc(s12, boot_size_rec_150).

0.78::true_val(boot_size_rec_150, us6_7); 0.22::true_val(boot_size_rec_150, unk_boot_150).

measured(s12, boot_size_rec_150, us6_7).

all_consistent(boot_size_rec_150) :-
    consistent(s12, boot_size_rec_150).

evidence(all_consistent(boot_size_rec_150)).
query(true_val(boot_size_rec_150, us6_7)).
query(true_val(boot_size_rec_150, unk_boot_150)).

% @attr boot_size_rec_154
% @type categorical
% @canonical false
% @original_name Boot size rec 154
% @values us7_8=US_7_8 unk_boot_154=Unknown
% @importance 0.90

0.85::acc(s12, boot_size_rec_154).

0.78::true_val(boot_size_rec_154, us7_8); 0.22::true_val(boot_size_rec_154, unk_boot_154).

measured(s12, boot_size_rec_154, us7_8).

all_consistent(boot_size_rec_154) :-
    consistent(s12, boot_size_rec_154).

evidence(all_consistent(boot_size_rec_154)).
query(true_val(boot_size_rec_154, us7_8)).
query(true_val(boot_size_rec_154, unk_boot_154)).

% @attr boot_size_rec_158
% @type categorical
% @canonical false
% @original_name Boot size rec 158
% @values us8_9=US_8_9 unk_boot_158=Unknown
% @importance 0.90

0.85::acc(s12, boot_size_rec_158).

0.78::true_val(boot_size_rec_158, us8_9); 0.22::true_val(boot_size_rec_158, unk_boot_158).

measured(s12, boot_size_rec_158, us8_9).

all_consistent(boot_size_rec_158) :-
    consistent(s12, boot_size_rec_158).

evidence(all_consistent(boot_size_rec_158)).
query(true_val(boot_size_rec_158, us8_9)).
query(true_val(boot_size_rec_158, unk_boot_158)).

% @attr boot_size_rec_162
% @type categorical
% @canonical false
% @original_name Boot size rec 162
% @values us9_10=US_9_10 unk_boot_162=Unknown
% @importance 0.90

0.85::acc(s12, boot_size_rec_162).

0.78::true_val(boot_size_rec_162, us9_10); 0.22::true_val(boot_size_rec_162, unk_boot_162).

measured(s12, boot_size_rec_162, us9_10).

all_consistent(boot_size_rec_162) :-
    consistent(s12, boot_size_rec_162).

evidence(all_consistent(boot_size_rec_162)).
query(true_val(boot_size_rec_162, us9_10)).
query(true_val(boot_size_rec_162, unk_boot_162)).

% @attr boot_size_rec_154w
% @type categorical
% @canonical false
% @original_name Boot size rec 154W
% @values us9_10=US_9_10 unk_boot_154w=Unknown
% @importance 0.90

0.85::acc(s12, boot_size_rec_154w).

0.78::true_val(boot_size_rec_154w, us9_10); 0.22::true_val(boot_size_rec_154w, unk_boot_154w).

measured(s12, boot_size_rec_154w, us9_10).

all_consistent(boot_size_rec_154w) :-
    consistent(s12, boot_size_rec_154w).

evidence(all_consistent(boot_size_rec_154w)).
query(true_val(boot_size_rec_154w, us9_10)).
query(true_val(boot_size_rec_154w, unk_boot_154w)).

% @attr boot_size_rec_158w
% @type categorical
% @canonical false
% @original_name Boot size rec 158W
% @values us10_11=US_10_11 unk_boot_158w=Unknown
% @importance 0.90

0.85::acc(s12, boot_size_rec_158w).

0.78::true_val(boot_size_rec_158w, us10_11); 0.22::true_val(boot_size_rec_158w, unk_boot_158w).

measured(s12, boot_size_rec_158w, us10_11).

all_consistent(boot_size_rec_158w) :-
    consistent(s12, boot_size_rec_158w).

evidence(all_consistent(boot_size_rec_158w)).
query(true_val(boot_size_rec_158w, us10_11)).
query(true_val(boot_size_rec_158w, unk_boot_158w)).

% @attr boot_size_rec_162w
% @type categorical
% @canonical false
% @original_name Boot size rec 162W
% @values us11_12=US_11_12 unk_boot_162w=Unknown
% @importance 0.90

0.85::acc(s12, boot_size_rec_162w).

0.78::true_val(boot_size_rec_162w, us11_12); 0.22::true_val(boot_size_rec_162w, unk_boot_162w).

measured(s12, boot_size_rec_162w, us11_12).

all_consistent(boot_size_rec_162w) :-
    consistent(s12, boot_size_rec_162w).

evidence(all_consistent(boot_size_rec_162w)).
query(true_val(boot_size_rec_162w, us11_12)).
query(true_val(boot_size_rec_162w, unk_boot_162w)).

% @attr rider_level
% @type categorical
% @canonical false
% @original_name rider_level
% @values intermediate=Intermediate unk_rider_level=Unknown
% @importance 0.85

0.88::acc(s_merchant, rider_level).

0.95::true_val(rider_level, intermediate); 0.05::true_val(rider_level, unk_rider_level).

measured(s_merchant, rider_level, intermediate).

all_consistent(rider_level) :-
    (indep(s_merchant), consistent(s_merchant, rider_level) ; \+indep(s_merchant)).

evidence(all_consistent(rider_level)).
query(true_val(rider_level, intermediate)).
query(true_val(rider_level, unk_rider_level)).