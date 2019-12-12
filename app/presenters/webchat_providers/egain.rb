module WebchatProviders
  module Egain
    def webchat_ids
      {
        "/government/organisations/hm-revenue-customs/contact/child-benefit" => 1027,
        "/government/organisations/hm-revenue-customs/contact/income-tax-enquiries-for-individuals-pensioners-and-employees" => 1030,
        "/government/organisations/hm-revenue-customs/contact/vat-online-services-helpdesk" => 1026,
        "/government/organisations/hm-revenue-customs/contact/national-insurance-numbers" => 1021,
        "/government/organisations/hm-revenue-customs/contact/self-assessment" => 1004,
        "/government/organisations/hm-revenue-customs/contact/tax-credits-enquiries" => 1016,
        "/government/organisations/hm-revenue-customs/contact/vat-enquiries" => 1028,
        "/government/organisations/hm-revenue-customs/contact/customs-international-trade-and-excise-enquiries" => 1034,
        "/government/organisations/hm-revenue-customs/contact/employer-enquiries" => 1023,
        "/government/organisations/hm-revenue-customs/contact/online-services-helpdesk" => 1003,
        "/government/organisations/hm-revenue-customs/contact/charities-and-community-amateur-sports-clubs-cascs" => 1087,
        "/government/organisations/hm-revenue-customs/contact/enquiries-from-employers-with-expatriate-employees" => 1089,
        "/government/organisations/hm-revenue-customs/contact/share-schemes-for-employees" => 1088,
        "/government/organisations/hm-revenue-customs/contact/non-uk-expatriate-employees-expats" => 1089,
        "/government/organisations/hm-revenue-customs/contact/non-resident-landlords" => 1086,
      }
    end

    def webchat_availability_url
      "https://www.tax.service.gov.uk/csp-partials/availability/#{webchat_id}"
    end

    def webchat_open_url
      "https://www.tax.service.gov.uk/csp-partials/open/#{webchat_id}"
    end

    def webchat_provider
      webchat_provider_id.to_s
    end

    def webchat_provider_config
      {
        "chat-provider": webchat_provider,
        "open-url": webchat_open_url,
        "availability-url": webchat_availability_url,
      }
    end
  end
end