# Attribute Mapping Specification

## Overview

You are mapping raw fact lines from a snowboard product research file
to a harmonized attribute schema. Each fact line has the format:
  `N. attribute name: value [sources]`

For each fact line, assign it to the most appropriate harmonized
attribute name from the schema below, or mark it as `null` if it
does not match any harmonized attribute.

## Mapping Rules

1. **Exact matches first**: If the fact's attribute name (case-insensitive,
   ignoring trailing unit suffixes like 'cm', 'mm') exactly matches a
   harmonized name, use it.
2. **Synonym matching**: If the attribute name is a known synonym
   (listed under 'original_names' for a harmonized attribute), map to
   that harmonized attribute.
3. **Semantic matching**: If the attribute clearly refers to the same
   concept as a harmonized attribute but uses different wording, map it.
4. **Unmapped**: If the attribute is genuinely unique to this product
   or doesn't fit any harmonized attribute, set canonical_name to null.
5. **Variant clusters**: Some attributes belong to variant clusters
   (e.g., size variants, source variants). Map to the SPECIFIC variant,
   not the generic canonical. The generic canonical is an alias only.
6. **One-to-one**: Each fact line maps to exactly one harmonized attribute
   (or null). Multiple fact lines may map to the same harmonized attribute.
7. **Source-qualified variants stay separate**: Attributes like
   'flex rating (merchant)' and 'flex rating (evo)' are DIFFERENT
   canonicals — do not merge them. Each source gets its own canonical.
8. **Disagreement facts**: Facts flagged with 'DISAGREEMENT' or '⚠️'
   map to the same canonical as the non-flagged version. The flag is
   informational only — conflict resolution happens downstream.

## Mapping Examples and Rationale

The following examples explain key harmonization decisions made
during schema construction. Use these as guidance for ambiguous cases:

- PRICING STRATEGY: Prices are canonicalized per retailer+currency combination (e.g., price_usd_evo, price_aud_merchant, price_eur_bluetomato) rather than merged into a single 'price' attribute. This preserves source trust information for downstream inference—different retailers and regions may have different actual prices at the same timestamp, reflecting local market dynamics.
- FLEX RATING SCALES: Flex ratings on /10 scales and /5 scales are mapped to separate canonicals (flex_rating_10_manufacturer vs flex_rating_5_scale) because converting between scales introduces error. The Good Ride, evo's standardized system, merchant data, and manufacturer specs may all use /10 scales but are kept separate (flex_rating_10_the_good_ride, flex_rating_10_evo, flex_rating_10_manufacturer) because the numeric values differ meaningfully across sources—source attribution enables downstream weighting of trust.
- DISAGREEMENT HANDLING: Multiple products flagged 'DISAGREEMENT' or '⚠️' on facts like camber type, core blend ratio, sidewall material, and flex ratings. These all map to the same canonical attribute (e.g., camber_type, core_material_blend_ratio_disagreement, sidewall_material_disagreement) rather than creating separate canonicals for each conflicting value. The conflict is preserved in the data record; downstream inference engine weights source credibility to resolve.
- SIZE-SPECIFIC DIMENSIONS: Attributes like effective_edge, waist_width, sidecut_radius, stance_width, contact_length, tip/tail_width are canonicalized with size suffix (e.g., effective_edge_165, waist_width_165) to enable cross-product comparison at matched sizes. A product with measurements at 154cm and 159cm gets two separate canonical attributes; attempting to merge them would lose precision.
- REVIEWER SOURCE SEPARATION: Reviews from The Good Ride, SnowboardingProfiles, Whitelines, forum users, Board of the World, and other sources each map to distinct canonicals (reviewer_opinion_the_good_ride, reviewer_opinion_snowboardingprofiles, etc.) because these sources use different rating methodologies, scales, and objectives. A board rated 'Great' by The Good Ride and 'Average' by SnowboardingProfiles is a data point, not a contradiction to flatten.
- SUBJECTIVE OPINION FACTS: Long narrative assessments (e.g., 'Smooth, surfy and playful in the nose and tail') map to categorical opinion canonicals (reviewer_opinion_whitelines) rather than forcing the narrative text into multiple attributes. This respects the original granularity while enabling structured comparison.
- MODEL YEAR AND VARIANT TRACKING: The 2027 Bataleon Disaster vs 2026 Goliath, standard Tweaker 2.0 vs Tweaker Pro, and Assassination vs Assassin Pro each map to distinct canonical attributes (flex_rating_10_manufacturer carries size- and model-year context in the data record). Avoid merging variants of the same board as different canonicals; use data provenance to distinguish.
- COMPARABLE BOARDS: Within-brand comparisons (comparable_board_in_brand) are kept separate from cross-brand alternatives (comparable_board_cross_brand) because they serve different recommendation functions. A 'CAPiTA Mercury is more all-round' statement goes into comparable_board_in_brand_mercury with narrative; 'Burton Custom Camber is a competitor' goes into comparable_board_cross_brand_burton_custom. This enables targeted quiver-building inference.
- MANUFACTURING DETAILS: Manufacturing location, environmental certifications, and facility practices have multiple disagreements (Austria vs Asia vs Dubai). All map to manufacturing_location_current and manufacturing_location_historical to preserve conflict. A board's sustainability story depends on accurate location data; downstream inference must weight sources carefully (Whitelines vs SnowboardingProfiles vs official site).
- PERFORMANCE RATINGS BY TERRAIN/SPEED: 'Good carving at high speed' vs 'gets wobbly at higher speeds' vs 'excellent for slow-speed carves' all converge on carving performance but with speed context. Map these to distinct narratives (carving_speed_suitability_narrative, high_speed_stability_narrative, low_speed_maneuverability_narrative) rather than a single carving_rating, which would lose nuance.
- BOOT SIZE AND WEIGHT RECOMMENDATIONS: Manufacturer-specified ranges (50-70kg) vs retailer interpretations (59-79kg) vs reviewer assertions ('liberal with boot sizes, conservative with weight') map to the same canonical attribute (recommended_weight_range_size) for that size. Disagreement flags and source data enable inference on whether a rider should follow manufacturer or reviewer guidance.
- CONSTRUCTION MATERIAL DISAGREEMENTS: Fiberglass type (BA LD vs BA MD), sidewall material (ABS vs Bamboo vs Cork), and core blend (70/30 vs 80/20 vs 1:2) all have conflicting source reports. Rather than choosing one, all map to the same canonical (fiberglass_type_disagreement, sidewall_material_disagreement, core_material_blend_ratio_disagreement) with source attribution. Downstream inference can weight recent sources (2026 spec) vs old (2024 model).
- SUSTAINABILITY CLAIMS: Super Sap Bio-Resin, FSC certification, Fair Trade Certified, 1% For The Planet, recycled content, and eco manufacturing practices all map to sustainability_certification with narrative. A product may claim multiple certifications; preserving all enables cross-validation of environmental benefit claims.
- TERRAIN SUITABILITY RATINGS: Explicit numeric terrain ratings (Park 7/10, All-Mountain 7/10, Powder 4/10 from Cardrona vs Park 4/10, All-Mountain 7/10, Powder 4/10 from Zombie Board Shop 2023) map to terrain_suitability_rating with source and year. The disagreement on park rating (7/10 vs 4/10) flags a model-year or source-quality issue; downstream weighting resolves.
- AVAILABILITY AND DELIVERY: preorder status, estimated delivery dates, retailer-specific in-stock/sold-out, and geographic restrictions (Australia only shipping) map to separate canonicals (availability_status, estimated_availability_date, retailer_shipping_restriction_narrative) to enable region-specific inventory inference.
- COMPARABLE BOARD PRICING: When a review mentions 'CAPiTA Mercury is $629.95–$679.95' or 'Lib Tech Orca is ~$120 more expensive,' the price goes into the comparable board's canonical (price_msrp_usd for Mercury) with source context, not as a separate 'competitor price' field. This unifies pricing data across all products while preserving comparison intent.
- WEIGHT PERCEPTION SUBJECTIVITY: 'Felt a little lighter than normal' vs 'One of the heavier boards I've measured' vs measured weight (2760g) all map to separate canonicals: weight_feel (subjective), board_weight_grams (measured), and weight_per_cm (normalized). Subjectivity is preserved; downstream recommendation can combine all three with confidence weighting.
- VARIANT SPECIFICATIONS: Bataleon Goliath vs Goliath+, Rome Agent vs Agent Pro, Jones Tweaker vs Tweaker Pro, etc. each have distinct flex, core, base, and price specs. Rather than creating 'variant_flex' and 'standard_flex' canonicals, map both to the same flex_rating_10_manufacturer canonical but tag in the data record which variant/model year. This avoids explosion of attribute names.
- HISTORICAL MODEL EVOLUTION: 'Changed from Cam-Out Camber to Trüe Camber for 2023 model' maps to camber_type with year context in the record, not separate 'camber_type_2023' canonicals. Likewise 'Predecessor construction: originally true twin, changed to directional in 2019' maps to predecessor_shape with year. Downstream inference can query evolution by year.
- RETAILER RELATIONSHIP AND SHIPPING: Free shipping over $50 at Bataleon, free shipping over $100 at Jones direct, international shipping restrictions, currency exchange favorability notes all map to retailer-specific narratives (retailer_bataleon_shipping_terms, retailer_jones_direct_return_policy) rather than product attributes. These are purchase context, not product specification, but preserve them for e-commerce integration.
- Merged 'flex rating (merchant-verified)', 'flex rating (manufacturer)', and 'flex rating (evo)' into separate canonicals because the SOURCE MATTERS — merchant ratings differ from manufacturer specs, and evo has its own /5 scale. Do NOT merge these together; downstream inference needs to know which source provided the measurement to handle disagreements.
- Kept 'effective edge 151 (manufacturer)' and 'effective edge 151 (merchant-verified)' as separate canonicals because the 2027 Bataleon model shows a shape revision: 114.4cm vs 113.9cm. Same canonical name flags them as the SAME CONCEPT, but the disagreement and source qualifier preserves measurement traceability.
- Mapped 'Available lengths (manufacturer)' and 'Available lengths (merchant verified)' to DIFFERENT canonicals because one shows the full 2025/26 lineup (148, 151, 154, 157, 153W, 156W) while merchant only has 151, 154, 157, 156W for 2027. This is inventory, not a disagreement about the same measurement.
- Price attributes are STRICTLY source+currency qualified: 'price_usd_msrp', 'price_usd_evo_sale', 'price_aud_merchant', 'price_eur_blue_tomato' are all different canonicals. A product may have 10+ price entries, and each must preserve the retailer and currency because these are different market instances, not conflicting claims about a single price.
- Flex rating disagreements (e.g., merchant 4/10 vs S2AS 3/10 for 2027 Bataleon) map to the SAME canonical as non-disagreement versions. The '⚠️ DISAGREEMENT' flag signals that downstream conflict resolution should inspect both sources, but the canonical name is the same because they measure the same concept on the same scale.
- Waist width disagreements (e.g., manufacturer 25.35cm vs merchant 24.4cm for Academy 152cm) map to separate size-specific canonicals ('waist_width_152_manufacturer' vs 'waist_width_152_merchant') rather than a unified 'waist_width_152'. This preserves source traceability while using consistent canonical naming for the concept.
- Renamed 'Warranty period (official warranty page)' to 'warranty_period_years' and mapped 'Warranty (About Us page 3-year)' to the SAME canonical even though they disagree (2-year vs 3-year). The canonical 'warranty_period_years' captures the concept; the disagreement is flagged for downstream resolution. Both values are preserved in the source data.
- Available-at attributes (academysnowboards.com, Baker Street Snow, Melbourne Snowboard, etc.) each get SEPARATE canonicals because they represent different retailer inventory snapshots. These are not variants of a single 'availability' measure; they are instance-specific availability records.
- Reviewer opinion attributes from different sources (The Good Ride, Snowboarding Profiles, Transworld, The Snow Chasers, Whitelines, Board of the World) map to SEPARATE canonicals like 'reviewer_opinion_good_ride', 'reviewer_opinion_snowboarding_profiles', etc. Narrative/subjective text cannot be merged; source attribution is critical.
- Campaign/award attributes like 'Transworld Good Wood Award', 'Outside Magazine recognition', 'Whitelines selection' map to SEPARATE canonicals because they track different award programs with different timing. A board may win both Transworld Good Wood 2018 AND 2020, which requires separate canonical entries or a 'year' qualifier.
- Terrain rating attributes (mountain 8/10, pipe 7/10, park 9/10, street 10/10 for Academy Propaganda) map to SEPARATE canonicals: 'terrain_rating_mountain_10', 'terrain_rating_pipe_10', etc. These are different performance dimensions, not variants of a single rating.
- Comparable board attributes (Nitro T1, Burton Name Dropper, CAPiTA DOA) do NOT get separate canonicals per competitor. They share 'comparable_board_flat_park_category' because they're all competitors in the same niche. The list of competitors is the value, not a separate canonical per competitor.
- Core material attributes (poplar, paulownia, bamboo wood species) get SEPARATE canonicals when they appear in different contexts: 'core_material_poplar_paulownia' (for core blend), 'core_wood_bamboo' (for stringers), 'core_wood_paulownia' (standalone). Same wood type, different structural roles.
- Bonus size specifications (e.g., nose/tail width 143cm, effective edge 151cm, sidecut radius 156cm) get canonical names tied to the SPECIFIC SIZE: 'nose_tail_width_143', 'effective_edge_151_merchant', 'sidecut_radius_156'. Size is integral to the canonical name, not a separate attribute.
- Variant attributes (Instigator Flat Top vs PurePop Camber, Rome Viper vs Viper Pro, Bataleon Disaster vs Disaster+) map to SEPARATE canonicals for geometry/profile (e.g., 'variant_flat_top_description') and pricing (e.g., 'price_usd_msrp_flat_top') because each variant is a distinct product configuration. Do NOT merge variants into a single canonical.
- Sustainability attributes (bio-based resin, FSC certification, solar manufacturing, carbon neutrality) get SEPARATE canonicals even when describing the same brand commitment because they measure different environmental metrics. 'sustainability_core_fsc' and 'resin_bio_based_source_a' are not substitutes for one another.
- Disagreement attributes flagged with '⚠️' or 'DISAGREEMENT' (flex rating, waist width, available lengths, sizing advice) map to the SAME canonical as their non-flagged counterparts. The flag alerts downstream tools; it doesn't create a separate canonical. Example: both 'flex rating (merchant) 4/10' and 'flex rating (S2AS) 3/10' map to 'flex_rating_10_merchant' and 'flex_rating_10_s2as'.
- Model lineage and generation attributes (e.g., 'Flagship Pro replaced the Ultra Flagship', 'Disaster+ first model year 2023') map to 'model_variant_history' style canonicals because they provide context about the product's evolution. These are NOT comparable board attributes; they're identity/timeline data.
- User review/forum opinion attributes (positive, negative, concern, complaint) map to 'user_review_positive', 'user_review_negative', etc. (not separated by source unless the source is critical, e.g., 'user_review_forum_snowboarding'). Subjective feedback doesn't always need source qualification unless multiple sources contradict.
- Binding recommendation attributes ('Recommended bindings', 'Suggested binding pairing') map to a single canonical 'recommended_bindings' because the value is a list of models that pair well. The canonical doesn't need source qualification because multiple reviewers recommending the same binding strengthens the suggestion, not contradicts it.
- Price attributes must be source-qualified with retailer + currency to prevent false merges. 'Price at evo.com' (USD) is distinct from 'Price at Blue Tomato EU' (EUR); both use different currencies and affect comparability.
- Flex ratings on /10 scale should map to `flex_rating_10_source` while flex ratings on /5 scale map to `flex_rating_5_source`. Example: evo's 'Flex: 5/5 (Stiff)' and merchant's 'Flex: 10/10' are different scales and cannot be merged—use scale-specific canonicals.
- Disagreement-flagged attributes (marked with ⚠️) map to THE SAME canonical as non-disagreement versions. For example, 'Flex rating (Snowleader, 2026 model): 10/10' and 'Flex rating (evo, 2025/2026 model): 5/5' both map to their respective source-qualified canonicals (`flex_rating_10_snowleader` and `flex_rating_5_evo`), but the disagreement note goes in the mapping guidance, not the canonical.
- Size-specific dimensions (effective edge, waist width, sidecut radius for specific sizes) are ALREADY harmonized in the reference list and are kept separate per size. Example: 'effective_edge_159' exists separately from 'effective_edge_160'. Unresolved size-specific attributes should follow the same pattern.
- Retailer and availability attributes should use `available_at_[retailer_name]` canonicals. When a merchant lists 'Available at Melbourne Snowboard Centre' and another lists 'Availability: Auski', these are different retailer presence facts and warrant separate canonicals or a unified listing with retailer name.
- Reviewer-sourced performance ratings ('Carving (TGR): Great', 'Carving (SnowboardingProfiles): Good') map to source-qualified canonicals (`carving_tgr`, `carving_snowboarding_profiles`) because the same concept is measured by different experts using potentially different criteria.
- User review quotes and subjective opinions should NOT be force-fitted into numeric scales. A quote like 'Really fun to turn' maps to `review_positive_turning`, not to a turning rating. Long narrative text belongs in separate canonicals from numeric scores.
- Graphic design variant descriptions ('Cherry Blossom graphic: Fiery red deck and palm tree base') are identity attributes describing unique visual characteristics of a product variant. These should use canonicals like `graphic_description_[variant_name]` rather than being merged with a generic `topsheet` attribute.
- Pro model information (designer, tribute rider, collaboration details) belongs in `brand_info` category, not in product construction or performance. Example: 'Designed with Masanori Takeuchi' maps to `pro_model_designer_collaboration`, distinct from technical specs.
- Brand/company historical facts ('Founded 2000', 'Acquired 1997', 'Parent company Nidecker Group') should map to brand_info canonicals, separate from product-specific attributes. Use `brand_founded`, `company_parent_company`, etc., which already exist in the reference list.
- Warranty and return policy attributes are distinct: 'Return policy (45 days)' maps to a warranty/return canonical; 'Warranty coverage (2 years)' maps to a different one. Do not merge these.
- Width variants (Wide, Ultra-Wide) should be handled as part of size-specific canonicals, e.g., `waist_width_159_wide`, not as separate concepts. The reference list already uses this pattern.
- Comparable/alternative board mentions should use `comparable_board_[brand_model]` or `alternative_[name]` canonicals to preserve which specific board is being compared and in what context.
- Model year and predecessor/successor relationships: 'First available 2019', 'Updated for 2026', 'Replaces prototype X' are all distinct identity facts and should map to separate canonicals or narrative fields.
- Sustainability attributes (B Corp status, FSC certification, manufacturing energy source) belong in the `sustainability` category, distinct from construction or brand info. Example: 'B Corp certified: Yes' maps to `b_corp_certification_status`.
- Performance ratings that aggregate multiple criteria (e.g., 'Park rating 5/10, Powder rating 8/10') should be decomposed into separate canonicals by terrain/use type, following the pattern in the reference list.
- Manufacturing location and factory information should distinguish between design/prototyping location vs. actual manufacturing location. 'Designed in Burlington, Vermont' ≠ 'Manufactured in Austria'.
- Boot size recommendations (e.g., 'Ideal US boot sizes 8-9 for 155cm') should be kept per-size, not merged across sizes. Use canonicals like `boot_size_fit_155` for size-specific recommendations.
- Professional/expert reviews from different sources (The Good Ride, SnowboardingProfiles, Whitelines) should have source-qualified canonicals even if they measure the same performance dimension. The reviewing methodology matters.
- Rider level assessments from different sources (merchant vs. The Good Ride vs. evo) may disagree slightly. Keep them as separate source-qualified canonicals; the disagreement note explains why sources diverge without forcing false harmonization.
- Merged 'Flex rating (Rome/Melbourne 2027)', 'Flex rating (evo 2025)', 'Flex rating (SkatePro)' into canonical flex_rating_10 because all use /10 scale. However, merchant, evo, and SkatePro each get source-qualified canonicals (flex_rating_merchant, flex_rating_evo) when they differ on the same product to preserve source trust.
- Separated flex_rating_5 (Jones official, 1-5 scale) from flex_rating_10 (all others, 1-10 scale) because numeric scales differ. Downstream inference can normalize if needed, but here we preserve original measurement units.
- Flex ratings with disagreements (e.g., Rome merchant 7/10 vs evo 6/10 for same model) map to the same canonical flex_rating_10; the disagreement flag in original data indicates conflict resolution is needed downstream.
- Price attributes split by retailer AND currency: price_usd_evo, price_aud_melbourne, price_eur_blue_tomato, etc. Each retailer+currency combo gets unique canonical to preserve pricing transparency and source attribution.
- Flex feel (descriptive terms like 'Medium', 'Stiff', 'Medium-Stiff') separated from flex_rating (numeric) because they capture qualitative on-snow experience, not numeric rating. Both map to 'flex_feel' canonical.
- Rider level (ability level) sourced from different authorities (merchant, evo, The Good Ride) kept separate as rider_level_merchant, rider_level_evo, rider_level_tgr to reflect potentially different interpretations of skill requirements.
- Performance ratings from The Good Ride (carving_rating_tgr, powder_rating_tgr, jumps_rating_tgr, pipe_rating_tgr, jibbing_rating_tgr) kept as separate canonicals per source and performance aspect because different reviewers may rate same aspect differently.
- Available sizes at different merchants/sources (e.g., 'Available sizes (2027 via Melbourne)' vs 'Available sizes (2025/2026 via Rome US)') map to same canonical available_sizes; source and model year captured in original data, canonical name stays consistent.
- Camber type 'Directional Twin' (2024 model per evo) vs 'Tapered Directional' (2026/2027 model) mapped to same canonical camber_type because it's the same board attribute, just changed between model years. Disagreement flag in original data indicates the actual discrepancy.
- Comparable and competitor boards (e.g., 'Jones Hovercraft', 'Lib Tech Orca', list of competitors) all map to single canonical comparable_board, but source reviews' specific comparisons (e.g., 'Comparison vs Rome Ravine: Stale Fish is stiffer...') get separate canonical comparable_board_description.
- Detailed comparison narratives ('6000s vs 9000s key difference: sidecut length') map to comparison_vs_competitor canonical, separating from simple product references.
- Warranty duration ('2 year limited warranty', '3 year with registration') and warranty terms ('2+1 extended warranty') both map to warranty_period canonical, with detail captured in value field.
- Use case attributes (primary_use_case, secondary_use_case, tertiary_use_case, best_suited_for, not_ideal_for, not_recommended_for) all collapse into ideal_use_case and not_ideal_for canonicals because downstream the inference engine can distinguish primary vs secondary from context.
- Board dimensions per size (waist_width_154, effective_edge_150, nose/tail_width_151) captured in reference list for standard sizes, but non-standard measurements (e.g., rare size 163cm) included in unmapped or mapped as size_chart_* canonicals to preserve completeness.
- Pro rider background, tenure, and model introduction year all mapped to distinct canonicals (pro_rider_name, pro_rider_tenure, pro_model_first_available, pro_rider_background) because each fact answers a different question about the pro program.
- Brand history and company info (Rome SDS founded, parent company, manufacturing location, factory workers count, annual revenue) split across brand_info category canonicals to avoid mixing factual identity with narrative description.
- Review scores from different publications (SnowboardingProfiles 87.3/100, Board of the World 93.41/100, Good Wood award count) each map to source-qualified canonical (overall_rating_sp, etc.) to preserve reviewer identity and maintain comparative value.
- User-reported facts ('One user reports feeling board limits after 70 km/h') and reviewer opinions ('Whitelines notes not most responsive board') both map to reviewer_opinion_* canonicals because they're qualitative assessments, not quantitative specs.
- Sustainability facts (FSC certification, B Corp status, recycled materials, carbon reduction %) split across sustainability category to allow different queries (core_certification vs b_corp_certified vs recycled_material_usage).
- Disagreements in core specs (e.g., 'Core wood species: 2025 model lists Aspen+Paulownia vs 2026 lists Poplar+Paulownia') map to same canonical as non-disagreement (core_material) with flags in original data; downstream inference handles resolution.
- Merged retailer-specific prices across products as separate canonicals per retailer+currency: e.g., price_usd_evo, price_usd_backcountry, price_eur_blue_tomato. Each retailer gets its own canonical even if only one product currently has that price, because downstream systems need source qualifiers to handle discounting, sale timing, and retailer-specific markup.
- Kept flex ratings separate by source when scales differ: flex_rating_10 for numeric /10 scales, flex_rating_snowboardingprofiles for reviewer assessments that differ from manufacturer, and flex_rating_manufacturer for official specs. The Good Ride flex feel observations map to separate canonical (flex_feel_on_snow_tgr) rather than merging with flex_rating because they describe on-snow experience vs static flex spec.
- Mapped disagreement-flagged attributes (prefixed with DISAGREEMENT or ⚠️) to the same base canonical as non-disagreement versions, e.g., both 'DISAGREEMENT — Flex rating (merchant: 3.5)' and 'Flex rating (Board of the World: 5.5)' map to flex_rating_disagreement rather than creating separate canonicals. This preserves all source variants as separate sub-canonicals while flagging that conflict resolution is needed.
- Created source-qualified review opinion canonicals for each reviewer/publication: reviewer_opinion_tgr, reviewer_opinion_snowboard_magazine, reviewer_opinion_whitelines, expert_opinion_berg_ski_shop, etc. These are distinct from numeric performance ratings (carving_rating_tgr, powder_performance_opinion_tgr) because opinion text is narrative and subjective, while ratings are quantified.
- Separated availability attributes by specific retailer (availability_evo, availability_berg_ski_shop, availability_melbourne_snowboard) rather than merging to generic 'available_at' because downstream systems need to track inventory status at specific retailers independently; stock status changes frequently and location matters for fulfillment.
- For colourway/graphics, created single canonical (colourway) that maps to both color names (e.g., 'Spray Paint') and full design descriptions (e.g., 'Dog-themed with dog tags'). This reflects that topsheet appearance is a single attribute that varies by model year; source differences in naming style are minor compared to the unifying concept.
- Kept core material specifications separate when sources disagree on wood species ratios (e.g., 75% Aspen/25% Paulownia vs 75% Paulownia/25% Aspen): both map to core_material_disagreement and each source variant becomes a separate canonical like core_material_evo, core_material_merchant. This preserves the conflicting data for downstream conflict resolution without forcing a choice.
- Separated performance assessments by review source and discipline: carving_tgr, powder_performance_opinion_tgr, jumps_performance_opinion_tgr, edge_hold_tgr. Even though the reference list has generic 'carving rating', source-specific variants are new canonicals because The Good Ride's assessment methodology differs from SnowboardingProfiles, and systems need to know which reviewer made which claim.
- Created measured vs manufacturer flex rating canonicals as distinct: flex_rating_manufacturer (from brand spec) vs flex_feel_on_snow_tgr (reviewer's hands-on assessment). These describe different things—intended flex vs how it actually feels—and should never be merged even though they're related.
- For model changes and history, created separate canonicals for different temporal contexts: model_change_descriptor (what changed between years), prior_model_variant (how it was positioned before), predecessor_model_replacement (which model it replaces). These capture different historical facts that cannot be merged.
- Separated price by condition tier: price_aud_rrp_merchant (recommended retail) vs price_usd_evo (sale price) vs price_usd_evo_blem (blemished condition). Condition-qualified prices are separate canonicals because they represent different product tiers and pricing strategies.
- Mapped brand history facts (founding date, manufacturing moves, market share, ownership changes) to separate canonicals: manufacturer_founding_date, manufacturing_location, manufacturing_relocation_history, market_share_estimate, current_ownership. These are independent facts that downstream systems may need to correlate or validate.
- For warranty information, created separate canonicals for manufacturer duration vs retailer duration vs void conditions: warranty_duration_manufacturer, warranty_duration_retailer, warranty_void_conditions. These are logically separate because warranty terms vary by purchase source.
- Kept environmental sustainability claims separate by type: zero_waste_manufacturing (operational fact), sustainability_material_description (material-specific), factory_solar_installation (infrastructure), core_sustainability_sourcing (material sourcing). These are distinct claims about different aspects of sustainability that need independent verification.
- Separated recommended rider level by source: rider_level_manufacturer, rider_level_merchant, rider_level_tgr, rider_level_snowboardingprofiles. Sources use different scales and criteria (brand positioning vs actual skill required per reviewer), so merged mapping would lose critical context for buyer guidance.
- For geometry specs by size (nose/tail width, waist width, sidecut radius), created size-specific canonicals (nose_tail_width_151, effective_edge_151, sidecut_radius_151) mapped from various sources (REI, merchant, manufacturer). Geometry is objective fact so source differences map to same canonical, but size qualifiers are essential to preserve.
- Mapped extensive review quotes and subjective assessments to source-specific opinion canonicals rather than trying to normalize them to categories: landing_confidence (TGR reviewer), torsional_stiffness_assessment (one reviewer's impression), slow_speed_playfulness. This preserves original reviewer voice while enabling downstream systems to weight or prioritize reviews.
- Created separate canonicals for historical reference pricing: price_usd_snowboard_magazine_reference (2022 Snowboard Mag pricing), price_usd_historical_reference (prior model year MSRP). These enable price tracking over time without conflating current vs historical MSRP.
- For team rider and professional athlete information, separated endorsements from factual credentials: pro_rider_credentials (competition results, Olympian status) vs team_rider_quote (opinion about board) vs team_rider_input_design (involvement in specs). These are distinct claims requiring different verification.
- Mapped 'comparable' references differently based on type: internal_competitor (same brand), external_competitor (other brands), cross_shopped_competitors (actually compete in market), similar_boards_recommended (reviewer suggestions). These capture different competitive relationships that downstream systems handle differently for market analysis vs buyer recommendations.
- Kept price canonicals separate per retailer+currency combination (e.g., price_usd_evo, price_usd_tactics, price_aud_melbourne_snowboard). This respects the principle that each retailer and currency combination is a distinct data point. Downstream inference can aggregate or compare if needed, but we preserve source granularity.
- Merged 'flex_feel_on_snow (independent reviewer)', 'flex_feel_on_snow (Board of the World)', and 'flex feel (the good ride)' into separate canonicals (flex_feel_on_snow_reviewer, flex_feel_the_good_ride) because each source may describe flex differently; qualitative feel is source-dependent and not interchangeable.
- Kept flex_rating_10_manufacturer, flex_rating_10_merchant, and flex_rating_10_snowboarding_profiles as separate canonicals even though all use /10 scale. Manufacturer ratings differ from merchant listings (e.g., manufacturer 5/10 vs merchant 4/10 for Skate Banana 150-154cm), and independent reviewer ratings are yet another perspective. Source qualification is critical.
- For the Skate Banana, 'Flex rating (manufacturer, 150-154cm)' and 'Flex rating (manufacturer, 156-162W)' are kept in a single canonical (flex_rating_10_manufacturer) with the understanding that downstream processing will note the size-specific values. This is because they are both manufacturer data, just for different size ranges.
- Mapped 'DISAGREEMENT — Flex rating' (ESIYSaCdUS) to the same flex_rating_10_manufacturer canonical as the non-disagreement version. The DISAGREEMENT flag itself serves as a signal that values conflict; the canonical name is the same because the underlying measurement is the same (manufacturer's /10 scale rating). Conflict resolution happens downstream.
- For review scores, kept publication-specific canonicals (board_of_the_world_rating, snowboarding_profiles_score, the_good_ride_overall_rating, etc.). While they all measure 'quality', different publications use different scales, criteria, and expertise. Merging them would lose critical source information.
- Grouped 'Comparable competitor price' (Skate Banana) with pricing canonicals because this is actual market data from competitors. It becomes price_usd_competitor_capita_doa, price_usd_competitor_jones_mountain_twin, etc., reflecting the specific competitor and providing market context.
- For size-specific geometry (effective_edge_155, waist_width_155, etc.), these already exist in the reference list. The unresolved attributes (e.g., 'Size variant 155cm — contact length') map directly to those reference canonicals. Each size is its own canonical per reference list design.
- Merged qualitative ride characteristic descriptions ('Ride characteristics — stability', 'Ride characteristics — dampness', etc.) into separate performance canonicals (ride_stability, ride_dampness) rather than creating a single 'ride_characteristics' bucket. This allows each performance aspect to be independently indexed and compared across products.
- For camber profile descriptions, created separate canonicals for each variant (c2x_camber_description, c3_camber_description) rather than merging them. Although both describe rocker/camber trade-offs, they are different technologies from different manufacturers and should not be conflated.
- Mapped 'DISAGREEMENT — asymmetry' (gwpGTjkNQC) to the same geometry canonical as non-disagreement specs. The conflict between merchant ('Asym Twin, Level 1') and reviewer ('fully symmetrical') is a data quality issue, not a reason to create separate canonicals. Both are describing the same attribute; the disagreement is in the values.
- Created separate canonicals for weight measurements by size (e.g., board_weight_measured_grams tracked per size) because weight varies meaningfully by size and model year. A 156cm board weighs differently from a 152cm board of the same model.
- For pro/con lists, created distinct canonicals (pro_jibbing_buttering, con_powder_performance) instead of generic 'pros' and 'cons' canonicals. This allows specific strengths and weaknesses to be indexed and compared across products.
- Kept 'Environmental history' (1986 ABS-to-polyethylene replacement) and 'Wood manufacturing process' (on-site shop, scrap repurposing) as distinct sustainability canonicals rather than merging into 'brand_info'. Environmental practices are actionable sustainability data distinct from brand narrative.
- For forum discussions (HCIRfP46Dh), grouped user comments on specific topics (e.g., 'Forum user — Dinghy strength', 'Forum user — Dinghy in choppy conditions') into a single forum_comparison canonical with the understanding that individual threads map to value variants of that canonical. This respects that forum sentiment is qualitative but consistent in source.
- For comparable boards, separated direct brand-to-brand comparisons ('vs Jones Tweaker', 'vs YES Typo') as distinct canonicals from generic 'Comparable boards in the category'. The former are explicit editorial comparisons; the latter is a curated list. Treating them differently preserves the editorial intent.
- Created separate canonicals for Travis Rice sizing recommendations (athlete_sizing_recommendations per size: 150, 156, 159, 162) rather than merging into a single 'athlete_recommendation'. Rice's board choices vary significantly by terrain type, and each size recommendation reflects different use cases.
- For retailer-specific availability (e.g., 'Availability - Snow Skiers Warehouse (Australia)', 'Availability - Auski (Australia)'), grouped multiple Australian retailers into a single generic availability_australian_retailers canonical with a note that it could be split per retailer if detailed tracking is needed downstream. This balances granularity with avoiding excessive canonicals.
- Kept 'Core naming disagreement' (6c05alvB2T: 'Light Core with Pop Carbon' vs 'Master Wood Core') separate from core_construction_description because it flags a potential naming inconsistency rather than a value disagreement. The canonical maps the fact of disagreement without forcing reconciliation.
- For model year pricing ('previous season 2025 MSRP'), created a separate price_usd_previous_season_msrp canonical rather than lumping with current MSRP. Comparing year-over-year pricing is valuable for market analysis and discount tracking.
- Mapped warranty restrictions across products to the same warranty_restriction canonical, even though different manufacturers have different policies. The underlying concept (warranty void if purchased from unauthorized dealer) is the same; the specific conditions are part of the value.
- For industry trend descriptions ('Industry trend alignment: back to camber') and editorial commentary ('Specialist vs generalist'), created distinct review/recommendation canonicals. These are qualitative editorial assessments that contextualize the board within industry trends rather than objective product facts.
- MERGED: Batch 0's 'camber_description' with batch 2's 'camber description' with batch 4's 'camber profile description' into single canonical 'camber_description' — all refer to textual description of camber profile shape and characteristics.
- KEPT SEPARATE: flex_rating_10 and flex_rating_5 as distinct canonicals even though both measure same concept — the scale difference (1–10 vs 1–5) means numeric values are not directly comparable. Downstream conversion is handled separately if needed.
- KEPT SEPARATE: flex_rating_10_manufacturer, flex_rating_10_merchant, flex_rating_10_evo, and flex_rating_10_the_good_ride as independent canonicals because all use same /10 scale but values often differ by source. Example: Rome merchant rates a board 7/10, evo rates same board 6/10, manufacturer rates it 6.5/10 — all three source-qualified variants should be preserved for inference engine to weight appropriately.
- DISAGREEMENT HANDLING: 'DISAGREEMENT — Flex rating' and similar flags across batches map to the same canonical as non-disagreement versions (e.g., flex_rating_10). The DISAGREEMENT flag is preserved in metadata but the attribute itself remains a single canonical; the inference engine downstream decides which source to trust.
- MERGED: All batch variants of 'price (USD MSRP)' across batches 0–5 into single 'price_usd_msrp' canonical because they all represent the same concept: manufacturer's suggested retail price in USD. Separate canonicals exist for sale prices (price_usd_evo_sale) and retailer-specific prices.
- RETAILER PRICING: Created separate canonicals for each major retailer+currency combination (price_usd_evo, price_usd_tactics, price_aud_merchant, etc.) because prices vary significantly by retailer and some offer exclusive discounts. This preserves source data for downstream price comparison and recommendation logic.
- MERGED: 'Available sizes', 'Sizes listed by Board of the World', 'Available sizes (manufacturer)' across batches into single canonical because they all represent the same concept. Disagreements about size availability between sources (batch 3 flagged some) map to same canonical with downstream conflict resolution.
- SEPARATED: availability_status (current stock: in stock/preorder/sold out) from estimated_availability_date (expected delivery date) — these are distinct concepts: one is binary state, the other is a date.
- MERGED: 'Rider level (evo)', 'Rider level (merchant)', 'Rider level (The Good Ride)', 'Rider level (manufacturer)' into separate source-qualified canonicals (rider_level_evo, rider_level_merchant, etc.) because different sources provide different skill level assessments for same board. Example: one merchant says 'Intermediate', The Good Ride says 'Advanced', manufacturer says 'All Levels' — keep all three.
- WEIGHT MEASUREMENTS: Kept size-specific weight canonicals (board_weight_157_grams, board_weight_158_grams) separate from weight_per_cm because they measure different aspects. Size-specific weight is absolute; weight_per_cm is normalized for comparison.
- GEOMETRY SIZES: Established pattern of size-qualified canonicals for all measured dimensions: effective_edge_155, waist_width_156, sidecut_radius_157, etc. This follows reference list pattern and allows independent tracking per size. Low-coverage sizes (e.g., 165cm or 170cm Wide) are kept in main schema if board is offered in those sizes.
- DISAGREEMENT EXAMPLE: Batch 0 flagged 'DISAGREEMENT — flex rating (13 products)' and Batch 3 flagged 'DISAGREEMENT — Flex rating' multiple times. These all map to flex_rating_10 and flex_rating_10_merchant canonicals with source qualifiers, preserving which sources disagreed for downstream analysis.
- PERFORMANCE RATINGS BY SOURCE: Kept separate canonicals for carving_rating_tgr vs carving_score_snowboardingprofiles vs carving_rating_manufacturer because these are independent measurements using different scales and methodologies. Do NOT attempt to harmonize to a single 'carving rating' — that would lose source distinction that inference engine needs.
- REVIEW OPINIONS: 'Whitelines opinion', 'The Good Ride verdict', 'forum consensus' all map to source-qualified opinion canonicals (reviewer_opinion_whitelines, reviewer_opinion_the_good_ride, user_review_forum) rather than performance ratings. Opinions are distinct from objective ratings.
- COMPARABLE BOARDS: Merged within-brand and cross-brand comparisons into comparable_board_same_brand and comparable_board_cross_brand. Source (batch 1 vs batch 5) doesn't matter; the distinction that matters is whether comparison is internal or external to brand.
- CONSTRUCTION TECHNOLOGY: Kept carbon_reinforcement, tri_axial_glass, bi_axial_glass, basalt_fiber, etc. as separate canonicals because they describe different reinforcement technologies. Not rolled into generic 'construction' because they have distinct performance implications.
- PROSCONS LISTS: 'Positive aspect' and 'negative aspect' canonicals preserve the specific aspect (e.g., 'pop/ollie', 'powder', 'ice grip') in a sub-field or appended to canonical name. This allows filtering pros/cons by type without losing specificity.
- TRIVIAL ATTRIBUTES: The 2,091 attributes already resolved by exact matching remain as trivial_schema list (brand, model_name, shape, core_material, etc.). These are pre-harmonized and require no further merging.
- LOW-COVERAGE ATTRIBUTES: Identified ~30 attributes with <90% coverage (e.g., nfc_chip in 5 products, limited_edition in 8 products, FSC_certification in 18 products). These are valid attributes but specialized; marked as 'low_coverage' for downstream conditional inclusion.
- PRICE DISAGREEMENT: Batch 3 flagged 'DISAGREEMENT — Flex rating (merchant vs multiple sources)'. This disagreement is preserved in the canonical name to signal downstream that multiple sources exist; the inference engine decides which source to trust based on configured weights.
- RETAILER-SPECIFIC VARIANTS: Some products available at multiple retailers with different prices. Rather than creating combinatorial explosion (price_usd_evo, price_usd_evo_sale, price_usd_evo_blem), created source-qualified canonicals (price_usd_evo, price_usd_evo_blem for B-grade). This keeps schema manageable while preserving distinctions that matter.
- SIZING GUIDANCE: Boot size recommendations ('Suggested boot size 156cm', 'boot size fit') are separate from geometry measurements. These are recommendation-level attributes about compatibility, not geometric specifications.
- SUSTAINABILITY ATTRIBUTES: Merged FSC_certification, B_Corp_status, recycled_materials, environmental_manufacturing into separate sustainability_ canonicals (one per certification type) rather than rolling into single 'sustainability' because each certification has distinct requirements and relevance.
- MANUFACTURER VS MERCHANT SPECS: Kept separate canonicals where manufacturer and merchant provide conflicting data. Example: core_material (manufacturer says 'Poplar/Paulownia 70/30', merchant says '80/20'). Disagreement is flagged in original data and both map to same canonical for inference engine conflict resolution.
- GRAPHIC VARIANTS: 'graphic_designer_artist', 'topsheet_appearance_description', 'available_colors' are separate canonicals because they describe different aspects of visual design. Not collapsed into single 'graphics' attribute.
- UNRESOLVED EDGE CASES: Three attributes in Batch 4 remain unmapped (Evil Twin Plus price, Bataleon founding year DISAGREEMENT, core wood blend DISAGREEMENT) — these are specialty variant/brand info that may belong in low_coverage or require downstream manual review.
- SOURCE TRUST NOT ASSUMED: Throughout the schema, no attempt was made to determine which source is 'more authoritative' (e.g., manufacturer vs retailer vs reviewer) for flex rating, price, or specs. Source-qualified variants preserve all observations. Downstream inference engine configured with trust weights will decide which sources to favor.
- SCALE NORMALIZATION: For numeric scales (flex ratings, performance scores), only separated canonicals where scale itself differs (e.g., /5 vs /10). Did NOT attempt to normalize different scales to a common scale — that is a downstream inference task that may require user context.

## Trivial Attributes (exact-match resolved)

These are high-frequency attributes matched by exact name.
Map any fact line whose attribute name matches (case-insensitive).

- `base_material` (90 products)
- `binding_compatibility` (61 products)
- `board_category` (150 products)
- `brand` (157 products)
- `camber_description` (81 products)
- `camber_type` (140 products)
- `core_material` (118 products)
- `edge_hold` (66 products)
- `edge_technology` (63 products)
- `flex_direction` (81 products)
- `gender` (143 products)
- `laminate` (76 products)
- `manufacturer` (94 products)
- `manufacturing_location` (89 products)
- `model_name` (157 products)
- `model_year` (122 products)
- `mounting_pattern` (104 products)
- `pop` (61 products)
- `product_type` (153 products)
- `resin` (81 products)
- `rider_level` (80 products)
- `riding_style` (93 products)
- `setback` (68 products)
- `shape` (157 products)
- `sidecut_type` (82 products)
- `sidewall_material` (73 products)
- `switch_riding` (78 products)
- `taper` (62 products)
- `topsheet` (64 products)
- `warranty` (101 products)
- `width_options` (76 products)

## Harmonized Attributes (synonym-resolved)

These attributes were harmonized from multiple synonym variants.
Map fact lines that match any of the listed original names.

### `availability_status` (62 products)
Category: availability
Original names: availability (2027 model), availability (2026 model), Availability status, order status (2027 AUD), Availability (Bataleon US 2025/26 model), Availability (2026 model, evo.com), Availability - evo, evo.com stock status
Notes: Current stock/order status: in stock, preorder, sold out, backordered, etc.

### `available_colors` (28 products)
Category: identity
Original names: colour option (2027 AU), colour option, Colour option (2026 NH), Colourway (2026), Colourway (2027), Colourway (2025), Graphic design (2027)
Notes: Available color/colorway options for a model.

### `available_sizes` (58 products)
Category: availability
Original names: Available sizes (2027, manufacturer), available sizes (2025/26 and 2027), Sizes listed by Board of the World, Available sizes (Jones 2026 site), Merchant listed sizes, Available sizes (2027 via Melbourne Snowboard Centre)
Notes: List of available size options for a model, may vary by model year.

### `base_glide_performance` (12 products)
Category: performance
Original names: Base speed when waxed, Base speed when dry, The Good Ride — base glide rating
Notes: Assessed base glide/speed performance.

### `base_material` (90 products)
Category: construction
Original names: base material
Notes: Already trivial

### `base_type` (65 products)
Category: construction
Original names: Base type (merchant/Melbourne/Blauer), Base type (evo.com/Level Nine Sports)
Notes: Base type (sintered, extruded, etc.). Disagreements flagged; all map to same canonical.

### `board_category` (150 products)
Category: identity
Original names: board category
Notes: Already trivial

### `board_weight_grams` (28 products)
Category: geometry
Original names: board weight 157cm, Weight (161cm non-split 3D Fish, user-measured), board weight (157cm, measured by SnowboardingProfiles), measured board weight (156cm), Board weight (157cm measured), Board weight (measured, 156cm 2026 model), Measured weight (SnowboardingProfiles, 155cm 2024 model)
Notes: Size-specific measured board weight in grams. Keep size in canonical naming (e.g., board_weight_157_grams). Should be defined per size.

### `brand` (157 products)
Category: identity
Original names: brand
Notes: Already trivial; included for completeness

### `camber_description` (81 products)
Category: performance
Original names: camber description (merchant), camber profile description, camber desc, Camber profile description (detailed), C3 camber description (manufacturer)
Notes: Detailed narrative description of camber profile. Already trivial in reference list; merged from batches 0–5.

### `camber_height_mm` (22 products)
Category: geometry
Original names: Camber height (measured, 157cm), camber height (measured by SnowboardingProfiles), Camber height (measured, 2024 model), camber height: 7mm, Camber height — disagreement: measured 6.5mm
Notes: Measured camber height in millimeters at specific sizes. Size-specific measurements kept with size qualifier in canonical name.

### `camber_type` (140 products)
Category: performance
Original names: camber type, Camber type
Notes: Already trivial; merged from batches 0–5. Disagreements (e.g., DISAGREEMENT — Camber type) map to this canonical.

### `carving_rating_tgr` (8 products)
Category: review
Original names: Carving rating (TGR), carving performance (TGR)
Notes: Carving performance rating from The Good Ride (e.g., Average, Great, Good).

### `carving_score_snowboardingprofiles` (8 products)
Category: review
Original names: Carving score (SP)
Notes: Carving score from SnowboardingProfiles on /5 scale.

### `chatter_performance` (8 products)
Category: performance
Original names: chatter (pre-2025), chatter (post-2025), Tip chatter
Notes: Performance regarding vibration/chatter feedback, especially at higher speeds.

### `comparable_board_cross_brand` (38 products)
Category: comparable
Original names: competitor alternative, Competitor (beginner category), Competitor (all-mountain category), Comparable board, Competitor list from SnowboardingProfiles, Competitor list from The Good Ride
Notes: Competitor boards from other brands. May include source attribution.

### `comparable_board_same_brand` (32 products)
Category: comparable
Original names: CAPiTA competitor (in-brand), CAPiTA related model, within Nitro lineup competitor, Related/upgraded model, comparable product (same brand), Comparable in-brand
Notes: Comparable boards within same brand/manufacturer. Preserves cross-reference for recommendation.

### `construction_material_innovation` (16 products)
Category: construction
Original names: reinforcement description, carbon reinforcement, Carbon tubes, carbon carbon stringer
Notes: Specific material innovation details (carbon tubes, stringers, reinforcement types, etc.).

### `contact_length_size` (24 products)
Category: geometry
Original names: contact length (159cm), Contact length (157cm), Running length
Notes: Size-specific contact (running) length. Keep size in canonical.

### `core_material` (118 products)
Category: construction
Original names: core material
Notes: Already trivial

### `core_material_blend_ratio` (8 products)
Category: construction
Original names: Core material (Bataleon.com 2025/26 Goliath page), Core material (merchant listing / The Source / Snowboard Shop), Core material (merchant listing from user)
Notes: Multiple conflicting reports of core blend ratio. Map to same canonical; downstream inference engine handles conflict.

### `edge_bevel_spec` (18 products)
Category: construction
Original names: Edge bevel spec (merchant), Edge bevel (evo/Ski Barn), Edge bevel (Divide/Sidecountry/Willi's), Edge bevel detail (Tactics), edge tuning (Merchant)
Notes: Edge bevel tuning specifications in degrees. Multiple disagreements; same canonical for all.

### `effective_edge_165` (6 products)
Category: geometry
Original names: Effective edge 165cm, effective edge (165cm)
Notes: Size-specific effective edge measurement at 165cm. Pattern of size-specific canonicals (effective_edge_[size]) is established in reference list.

### `estimated_availability_date` (18 products)
Category: availability
Original names: estimated availability April/May 2026, Australia delivery estimate, estimated availability early June 2026, Availability (2027 model): Preorder, estimated delivery, Estimated delivery (AU retailers), Estimated availability, Model release date (2027 variant)
Notes: Expected delivery/availability date for preorder items.

### `flex_feel` (68 products)
Category: performance
Original names: flex feel (Good Ride), flex feel (evo, 2026 model), flex feel (evo, 2025 model), flex feel (reviewer, Snowboard Robot), flex feel (reviewer, The Good Ride), flex feel (on-snow, review), flex feel (SnowboardingProfiles on-snow), Flex feel, Flex feel (the good ride), Flex description (evo standardized), Flex feel (the good ride review)
Notes: Merged from batches 0–5. Descriptive flex feel (e.g., 'Medium', 'Stiff', 'Medium-Stiff'). Separated from numeric ratings because these capture qualitative experience on snow.

### `flex_rating_10` (86 products)
Category: performance
Original names: flex rating (merchant, base model), Flex rating (merchant listing), Flex rating (Blauer Board Shop / 2026), flex rating (merchant listing for 2027), flex rating (per Rome/Melbourne Snowboard Centre 2027), flex rating (per evo 2025 model listing), flex rating (per SkatePro, described as), flex rating (merchant, 1-10 scale), Flex rating (merchant, 2027), Flex rating (merchant data)
Notes: Merged flex ratings on /10 scale. Disagreements flagged in original data map to this canonical. Source-qualified variants (flex_rating_10_merchant, flex_rating_10_evo, etc.) are separate canonicals because values can differ by source even on same scale.

### `flex_rating_10_evo` (28 products)
Category: performance
Original names: flex description (evo classification), Flex category (evo), Flex rating (evo scale), Flex rating (DISAGREEMENT — evo, 2025/2026 model)
Notes: evo.com's standardized flex classification. Disagreements map to same canonical; source is preserved by 'evo' qualifier.

### `flex_rating_10_manufacturer` (42 products)
Category: performance
Original names: Flex rating (manufacturer), flex rating (manufacturer, 157cm–164W), Flex rating (manufacturer spec table), Flex rating (Rome manufacturer), flex rating (manufacturer on lib-tech.com, 2026 specs table), Flex rating (manufacturer 2025/26 page), Flex rating (manufacturer 2027 official)
Notes: Manufacturer-specified flex ratings on /10 scale. Separate from merchant/retailer ratings because manufacturers often provide different values than what merchants report.

### `flex_rating_10_the_good_ride` (12 products)
Category: performance
Original names: flex rating (The Good Ride)
Notes: The Good Ride reviewer's assessed flex rating on /10 scale.

### `flex_rating_5` (8 products)
Category: performance
Original names: Flex rating (Blauer Board Shop 2025 model), flex rating (Blauer Board Shop / 2026): 1–4/10 (Soft), Flex rating (Jones official, 1-5 scale), Flex rating numeric, Flex rating (Nidecker official / Snowboard Zezula), Flex rating (merchant/merchant)
Notes: Flex ratings using /5 scale (1=Soft, 5=Stiff). Kept separate from /10 scale to prevent confusion and conversion errors.

### `freestyle_park_rating` (8 products)
Category: performance
Original names: freestyle/park rating (manufacturer), Freestyle/Park rating (Jones official)
Notes: Manufacturer rating for freestyle/park performance.

### `gender` (143 products)
Category: identity
Original names: gender
Notes: Already trivial

### `graphic_designer_artist` (42 products)
Category: identity
Original names: pro rider / designer, Graphic design, Graphic designer (2027 edition), Graphic artist (26/27 Tweaker 2.0 series), Graphic design by, board art by, graphic artist, Designer, Graphic artist (2026), Board art by
Notes: Artist or designer credited with graphic design/topsheet art.

### `jibbing_rating_tgr` (8 products)
Category: review
Original names: Jibbing rating (TGR), jibbing (TGR)
Notes: Jibbing/rails rating from The Good Ride.

### `jumps_rating_tgr` (8 products)
Category: review
Original names: Jumps rating (TGR), jumps (TGR)
Notes: Jumps/kicker rating from The Good Ride.

### `manufacturer` (94 products)
Category: brand_info
Original names: manufacturer
Notes: Already trivial

### `manufacturing_location_current` (52 products)
Category: brand_info
Original names: Manufacturing location (current, per multiple sources), Manufacturing location (current, source A), Manufacturing location (current, source B — DISAGREEMENT), Manufacturing location (current), Current manufacturing location, Manufacturing location, Factory location
Notes: Current factory/production location. Multiple disagreements flagged; all map to same canonical for downstream resolution.

### `manufacturing_location_prior` (18 products)
Category: brand_info
Original names: Manufacturing location (historic), Manufacturing location (conflicting), Manufacturing location (historical note — DISAGREEMENT), Prior manufacturing location, Previous manufacturing location, Historical manufacturing location
Notes: Historical manufacturing locations and transitions.

### `model_first_available_year` (28 products)
Category: identity
Original names: Goliath first available, Huck Knife Pro first available, Predecessor model first available, model first available, Model first year available, model first released, first year of model, Model first appeared
Notes: First year a model was released/available for sale.

### `model_name` (157 products)
Category: identity
Original names: model name
Notes: Already trivial

### `model_year` (122 products)
Category: identity
Original names: model year
Notes: Already trivial

### `mounting_pattern` (104 products)
Category: construction
Original names: mounting pattern
Notes: Already trivial

### `negative_aspect` (44 products)
Category: review
Original names: negative — uneven snow, negative — powder, negative — not for beginners, negative — slow speed experience, negative — dampening, negative — ice grip, negative — not a jib board, negative — price, Con — C3 profile, Con — size range, Con — carving freeride, Con — powder performance, Con — speed limitations
Notes: Negative attributes/cons from reviewer analysis. Preserve the specific aspect.

### `nose_tail_width_165` (6 products)
Category: geometry
Original names: Nose/tail width 165cm, nose/tail width (165cm)
Notes: Size-specific nose and tail width at 165cm.

### `on_snow_feel_tgr` (8 products)
Category: review
Original names: On-snow feel (TGR), on snow feel (TGR)
Notes: Overall on-snow feel rating from The Good Ride (e.g., Stable, Locked-In, Semi-Locked-In).

### `overall_rating_snowboardingprofiles` (12 products)
Category: review
Original names: Overall rating score (SP), Overall score (BoardOfTheWorld, park category), SnowboardingProfiles category average
Notes: Overall rating score from SnowboardingProfiles out of 100.

### `pipe_rating_tgr` (6 products)
Category: review
Original names: Pipe rating (TGR), pipe (TGR)
Notes: Halfpipe rating from The Good Ride.

### `positive_aspect` (48 products)
Category: review
Original names: positive — pop/ollie, positive — spring out of turn, positive — turny, positive — carving on groomers, positive — edge hold with camber, positive — lightweight, positive — jump approach and landing, positive — one board quiver potential, Pro — jibbing & buttering, Pro — pop for jumping, Pro — edge hold, Pro — carving ability, Pro — confidence
Notes: Positive attributes/pros from reviewer analysis. Merged from all batches. Preserve the specific aspect in a separate field.

### `powder_rating_tgr` (8 products)
Category: review
Original names: Powder rating (TGR), powder performance (TGR)
Notes: Powder performance rating from The Good Ride.

### `powder_score_snowboardingprofiles` (8 products)
Category: review
Original names: Powder score (SP)
Notes: Powder score from SnowboardingProfiles on /5 scale.

### `predecessor_model_name` (18 products)
Category: identity
Original names: Predecessor model (women's), Predecessor model (men's equivalent), predecessor model, Predecessor board
Notes: Name of the previous/predecessor model in the line.

### `price_aud_merchant` (65 products)
Category: pricing
Original names: Price at Melbourne Snowboard Centre (AUD, 2027 model), Price AUD (Ballistyx), price AUD (merchant), Price AUD (Melbourne Snowboard Centre), AUD price (merchant data), Price (AUD, merchant site, 2027), AUD RRP (merchant verified), Price (AUD - merchant provided)
Notes: Merged from batches 0–5. Australian retailer pricing in AUD from various merchants (Melbourne Snowboard Centre, Ballistyx, etc.). When multiple Australian retailers differ significantly, separate canonicals may be needed but grouping as generic merchant AUD for now.

### `price_cad_prfo` (12 products)
Category: pricing
Original names: price (CAD), Price (CAD), Sale price CAD at PRFO Sports Canada, price at PRFO Sports (CAD), Price (CAD - PRFO Sports Canada)
Notes: PRFO Sports Canada retailer pricing in CAD.

### `price_eur_blue_tomato` (24 products)
Category: pricing
Original names: price (EUR, EU retailers), Price EUR (BlueTomato EU), Price (EUR, Blue Tomato EU), price at BlueTomato EU (EUR), Price (EUR - Blue Tomato EU markets)
Notes: Blue Tomato European retailer pricing in EUR.

### `price_gbp_blue_tomato_uk` (18 products)
Category: pricing
Original names: price (GBP), Price GBP (BlueTomato UK), price at BlueTomato UK (GBP), GBP price (Blue Tomato UK), Price (GBP - Blue Tomato UK)
Notes: Blue Tomato UK retailer pricing in GBP.

### `price_usd_backcountry` (28 products)
Category: pricing
Original names: price (USD, discounted 2026 model year at US retailers), Price USD (Backcountry), USD price (Backcountry, 2026 model sale), Price (USD, Backcountry.com), USD sale price (Backcountry, 2026 model)
Notes: Backcountry.com pricing in USD.

### `price_usd_evo` (78 products)
Category: pricing
Original names: Price at evo.com (2026 model), Price at evo.com, evo.com (2026 model on sale), evo price (current sale), Price at evo (current sale), Price (USD, 2026 model, evo.com), Price at evo.com (2025 model, USD), Price (USD, evo.com sale), Price (USD, evo sale, 2026 model)
Notes: Merged from batches 0–5. evo.com retail pricing in USD, including MSRP and sale prices. Separate canonical from MSRP because evo often lists both.

### `price_usd_msrp` (95 products)
Category: pricing
Original names: price (MSRP, USD), USD MSRP, Price (USD MSRP, manufacturer 2026 model), MSRP (USD), Price — USD (CAPiTA official, 2026 model), Price (USD MSRP, 2027 model)
Notes: Merged from batches 0–5. Manufacturer's suggested retail price in USD. Separate from sale prices and retailer-specific pricing.

### `price_usd_rei` (18 products)
Category: pricing
Original names: price at REI (USD), Price (USD, 2026 model, REI), Price (USD, REI)
Notes: REI/REI Co-op sale pricing in USD.

### `price_usd_tactics` (32 products)
Category: pricing
Original names: Price at Tactics (current sale), Price at Tactics.com, Tactics price (current sale), Price at Tactics (USD, on sale), Price (USD, Tactics — on sale), Price (USD, 2026 model, Tactics), USD sale price (Tactics, 2026 model)
Notes: Merged from batches 0–5. Tactics.com retail pricing in USD.

### `pro_rider_name` (34 products)
Category: brand_info
Original names: pro rider / designer, Pro rider (2027 model), Pro riders (brand-wide for HK Pro), Pro model/designers, Designer/pro model, Designed in collaboration with, Pro model rider, Pro rider achievement
Notes: Professional rider or designer associated with model. May be singular or multiple.

### `product_type` (153 products)
Category: identity
Original names: product type
Notes: Already trivial

### `recommended_boot_size_165` (2 products)
Category: recommendation
Original names: Recommended boot size 165cm
Notes: Size-specific recommended boot size at 165cm.

### `recommended_weight_165` (4 products)
Category: recommendation
Original names: Recommended weight 165cm
Notes: Size-specific recommended rider weight range at 165cm.

### `recommended_weight_range_size` (28 products)
Category: recommendation
Original names: Recommended weight (159cm), recommended rider weight, Weight recommendation
Notes: Size-specific recommended rider weight range. Keep size in canonical.

### `redesign_year` (12 products)
Category: identity
Original names: Major redesign year, 2027 model year redesign, Tweaker 2.0 redesign for 2027
Notes: Year of major redesign or significant spec changes.

### `return_policy_terms` (12 products)
Category: warranty
Original names: Return policy (Source Boards), manufacturer return policy, Returns
Notes: Return policy terms and conditions by retailer/manufacturer.

### `reviewer_opinion_snowboardingprofiles` (12 products)
Category: review
Original names: SnowboardingProfiles overall impression, SnowboardingProfiles verdict, SnowboardingProfiles assessment
Notes: Overall impressions and assessments from SnowboardingProfiles reviewer.

### `reviewer_opinion_the_good_ride` (38 products)
Category: review
Original names: camber description per The Good Ride, The Good Ride opinion, The Good Ride verdict, The Good Ride review title, The Good Ride sizing advice, The Good Ride overall impression, The Good Ride overall assessment
Notes: Opinions, assessments, and sizing advice from The Good Ride reviewer.

### `reviewer_opinion_whitelines` (16 products)
Category: review
Original names: Whitelines opinion, Whitelines review, Whitelines verdict, Whitelines reviewer tip
Notes: Opinions and assessments from Whitelines reviewer.

### `riding_style` (93 products)
Category: identity
Original names: riding style
Notes: Already trivial

### `shape` (157 products)
Category: geometry
Original names: shape
Notes: Already trivial

### `sidecut_radius_165` (6 products)
Category: geometry
Original names: Sidecut radius 165cm, sidecut radius (165cm)
Notes: Size-specific sidecut radius at 165cm.

### `sidecut_radius_size` (18 products)
Category: geometry
Original names: Sidecut radius (162cm), Sidecut radius 159cm
Notes: Size-specific sidecut radius. Keep size in canonical.

### `skill_level_recommendation` (42 products)
Category: recommendation
Original names: Rider level (evo), Rider level (merchant), Rider level (Balmoral), best suited for, target rider, Target rider (King Snow)
Notes: Recommended skill level or rider type. May differ by source.

### `speed_rating_tgr` (8 products)
Category: review
Original names: Speed rating (TGR), speed (TGR)
Notes: Speed/glide rating from The Good Ride.

### `stance_width_range_size` (38 products)
Category: geometry
Original names: Stance range (162cm), stance range, Stance details, Stance width, Min/max stance
Notes: Size-specific stance width range and setback from center. Keep size in canonical (e.g., stance_range_162).

### `sustainability_certification` (42 products)
Category: sustainability
Original names: environmental features, Sustainability feature, environmental non-profit, manufacturing facility certification, FSC certified, B Corp certified, Sustainability — core, Sustainability — base
Notes: Sustainability certifications and environmental commitments.

### `terrain_suitability` (28 products)
Category: recommendation
Original names: Terrain rating (Cardrona), Terrain rating (Zombie Board Shop, 2023 model), Terrain suitability, Ideal terrain
Notes: Suitability for specific terrain types (park, all-mountain, powder, etc.).

### `tip_tail_width_size` (22 products)
Category: geometry
Original names: Tip/Tail width (159cm), Nose/tail width (159cm), Tip width 151cm
Notes: Size-specific tip/tail (nose/tail) widths. Keep size in canonical.

### `topsheet_appearance_description` (12 products)
Category: identity
Original names: Topsheet appearance, topsheet appearance (2026 model), All-black with collage of mini 3D-raised graphics
Notes: Description of topsheet visual design and appearance.

### `turn_initiation_performance` (12 products)
Category: performance
Original names: Turn exit, turn initiation, edge-to-edge performance
Notes: Performance in turn initiation and edge-to-edge transitions.

### `user_review_forum` (28 products)
Category: review
Original names: forum consensus, forum caution, forum criticism, Forum user (on board vs alternatives), forum user review, Forum user opinion
Notes: User reviews and consensus from snowboarding forums.

### `waist_width_165` (6 products)
Category: geometry
Original names: Waist width 165cm, waist width (165cm)
Notes: Size-specific waist width at 165cm. Follows reference list pattern.

### `warranty` (101 products)
Category: warranty
Original names: warranty
Notes: Already trivial; high-level warranty flag

### `warranty_period_years` (22 products)
Category: warranty
Original names: Warranty (Channel boards), warranty period, Warranty (official warranty page)
Notes: Warranty coverage period in years from date of purchase.

### `weight_per_cm` (8 products)
Category: geometry
Original names: Weight per cm (154cm measured), weight per cm (measured), Weight per cm (measured, 156cm), Average weight per cm (300+ boards sample)
Notes: Weight normalized by board length in grams per cm. Useful for comparing efficiency across sizes.

## Variant Clusters

These attributes are variants of a common base concept.
Map to the SPECIFIC variant, not the generic name.
The generic canonical is provided for cross-product comparison only.

### Cluster: `price` (retailer_currency, 9 members)
Representative: `price_usd_msrp` — USD MSRP has the widest product coverage (95 products) of any price variant
Members: price_aud_merchant, price_cad_prfo, price_eur_blue_tomato, price_gbp_blue_tomato_uk, price_usd_backcountry, price_usd_evo, price_usd_msrp, price_usd_rei, price_usd_tactics
Description: Board retail price — varies by retailer and currency

### Cluster: `flex_rating` (source_and_scale, 6 members)
Representative: `flex_rating_10` — Generic merchant 1–10 flex rating has the widest coverage (86 products)
Members: flex_rating_10, flex_rating_10_evo, flex_rating_10_manufacturer, flex_rating_10_the_good_ride, flex_rating_5, flex_feel
Description: Board flex rating — varies by source and scale (numeric and qualitative)

### Cluster: `manufacturing_location` (source, 3 members)
Representative: `manufacturing_location` — Base 'manufacturing_location' has the widest coverage (89 products)
Members: manufacturing_location, manufacturing_location_current, manufacturing_location_prior
Description: Where the board is/was manufactured — varies by current vs prior facility

### Cluster: `warranty` (source, 2 members)
Representative: `warranty` — Base 'warranty' attribute has the widest coverage (101 products)
Members: warranty, warranty_period_years
Description: Warranty terms and duration — varies by representation (text terms vs numeric years)

### Cluster: `rider_level` (source, 2 members)
Representative: `rider_level` — Base 'rider_level' has the widest coverage (80 products)
Members: rider_level, skill_level_recommendation
Description: Recommended rider skill level — varies by source

### Cluster: `reviewer_opinion` (source, 4 members)
Representative: `reviewer_opinion_the_good_ride` — The Good Ride opinions have the widest coverage among reviewer sources (38 products)
Members: reviewer_opinion_snowboardingprofiles, reviewer_opinion_the_good_ride, reviewer_opinion_whitelines, user_review_forum
Description: Qualitative reviewer/forum opinion of the board — varies by review source

### Cluster: `comparable_board` (source, 2 members)
Representative: `comparable_board_cross_brand` — Cross-brand comparables have the widest coverage (38 products)
Members: comparable_board_cross_brand, comparable_board_same_brand
Description: Comparable / alternative board — varies by whether the comparison is in-brand or cross-brand

### Cluster: `camber_profile` (source, 3 members)
Representative: `camber_type` — Camber type (named profile) has the widest coverage (140 products)
Members: camber_type, camber_description, camber_height_mm
Description: Camber profile description — varies by representation (named type, prose description, or measured height)

### Cluster: `carving_rating` (source, 2 members)
Representative: `carving_rating_tgr` — The Good Ride and SnowboardingProfiles carving ratings have equal coverage (8 products); TGR chosen as default
Members: carving_rating_tgr, carving_score_snowboardingprofiles
Description: Carving performance rating — varies by review source

### Cluster: `powder_rating` (source, 2 members)
Representative: `powder_rating_tgr` — TGR and SP powder ratings have equal coverage (8 products); TGR chosen as default
Members: powder_rating_tgr, powder_score_snowboardingprofiles
Description: Powder performance rating — varies by review source

### Cluster: `sidecut_radius` (size, 2 members)
Representative: `sidecut_radius_size` — Generic per-size sidecut radius has wider coverage (18 products) than the 165cm-specific variant
Members: sidecut_radius_165, sidecut_radius_size
Description: Board sidecut radius — varies by board size

### Cluster: `tip_tail_width` (size, 2 members)
Representative: `tip_tail_width_size` — Generic per-size tip/tail width has wider coverage (22 products) than the 165cm-specific variant
Members: nose_tail_width_165, tip_tail_width_size
Description: Tip/tail (nose/tail) width — varies by board size

### Cluster: `recommended_weight_range` (size, 2 members)
Representative: `recommended_weight_range_size` — Generic per-size recommended weight has wider coverage (28 products) than the 165cm-specific variant
Members: recommended_weight_165, recommended_weight_range_size
Description: Recommended rider weight range — varies by board size

### Cluster: `availability` (source, 2 members)
Representative: `availability_status` — Availability status has the widest coverage (62 products)
Members: availability_status, estimated_availability_date
Description: Availability information — varies by representation (status text vs estimated date)

### Cluster: `board_designer` (source, 2 members)
Representative: `graphic_designer_artist` — Graphic designer/artist field has wider coverage (42 products); source data often conflates the two roles
Members: graphic_designer_artist, pro_rider_name
Description: Person credited with the board's design or pro-model identity — varies by whether listed as graphic artist or pro rider

### Cluster: `board_weight` (source, 2 members)
Representative: `board_weight_grams` — Total board weight in grams has wider coverage (28 products) than weight-per-cm normalization
Members: board_weight_grams, weight_per_cm
Description: Measured board weight — varies by representation (total grams vs grams per cm)

### Cluster: `base_spec` (source, 2 members)
Representative: `base_material` — Base material has the widest coverage (90 products)
Members: base_material, base_type
Description: Board base specification — varies by representation (material composition vs sintered/extruded type)

### Cluster: `topsheet` (source, 2 members)
Representative: `topsheet` — Base 'topsheet' attribute has the widest coverage (64 products)
Members: topsheet, topsheet_appearance_description
Description: Topsheet specification — varies by representation (material vs visual appearance)

### Cluster: `core_material` (source, 2 members)
Representative: `core_material` — Core material has the widest coverage (118 products)
Members: core_material, core_material_blend_ratio
Description: Core composition — varies by representation (qualitative material vs numeric blend ratio)

### Cluster: `model_introduction_year` (source, 2 members)
Representative: `model_first_available_year` — First-available year has wider coverage (28 products) than redesign year
Members: model_first_available_year, redesign_year
Description: Significant year for the model lineage — varies by event (first available vs redesign)
