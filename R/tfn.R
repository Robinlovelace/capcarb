#' Combine zones and return a region
#'
#' @param regions Regional dataset
#' @param zone_text Regex to identify regions to group together
#'
#' @return sf object
#' @export
#'
#' @examples
#' cc_get_region()
cc_get_region = function(
  regions = pct::pct_regions,
  zone_text = "manc|yorks|lanc|chesh|liv|north-e|north-y|cumbria|humb"
) {
  regions_tfn = regions[grepl(pattern = zone_text, ignore.case = TRUE, x = regions$region_name), ]
  sf::st_union(sf::st_sfc(regions_tfn$geometry))
}
