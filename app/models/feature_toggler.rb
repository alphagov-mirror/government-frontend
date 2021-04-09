class FeatureToggler
  attr_reader :feature_flags

  def initialize(feature_flags)
    @feature_flags = feature_flags
  end

  def use_recommended_related_links?(content_item_links, request_headers)
    return false if content_item_links.nil?

    # puts "FLAG ENABLED"
    # pp HttpFeatureFlags.instance.add_http_feature_flag(FeatureFlagNames.recommended_related_links, "true")

    # puts "ordered_related_items"
    # pp content_item_links["ordered_related_items"]
    #
    # puts "ordered_related_items_overrides"
    # pp content_item_links["ordered_related_items_overrides"]
    #
    # puts "FEATURE FLAG IN HEADER"
    # pp RequestHelper.headerise("Govuk-Use-Recommended-Related-Links")
    #
    # puts "HEADER"
    # pp RequestHelper.get_header("Govuk-Use-Recommended-Related-Links", request_headers)

    content_item_links.fetch("ordered_related_items", []).empty? &&
      content_item_links.fetch("ordered_related_items_overrides", []).empty? &&
      @feature_flags.feature_enabled?(FeatureFlagNames.recommended_related_links, request_headers)
  end
end
