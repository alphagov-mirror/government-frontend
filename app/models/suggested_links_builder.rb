class SuggestedLinksBuilder
  def initialize(content_item)
    @content_item = content_item
  end

  def suggested_related_links
    @content_item["links"].fetch("suggested_ordered_related_items", [])
  end

  def weighted_related_items

    # These are what Zach has sent me:
    # {"602821fb-7631-11e4-a3cb-005056011aef": ["5e361109-7631-11e4-a3cb-005056011aef", "df5aebd2-694f-4065-ab79-b16e1ce96f78", "34fc58f1-5c54-4449-a1ff-e35df81a2a34", "91ee3e0d-9af6-4fb3-b60a-0518caa3c182", "3c61109d-1e00-4c26-8fdf-46771da2539c"], "639878d1-ca38-47b3-8718-ebf652a66e58": ["b2b0a09c-94c7-4cfd-8a5d-d5684159f7fd", "79cee423-2a64-4f8e-9ac9-a3be88d5506b", "60289472-7631-11e4-a3cb-005056011aef", "46683896-6695-4ead-a2ee-9ee183e9f6fb", "60548a72-7631-11e4-a3cb-005056011aef"], "ce23f26e-605e-466b-8c07-bc957de5b744": ["b350e61d-1db9-4cc2-bb44-fab02882ac25", "80918a0c-f2bb-44cd-8763-abc07a137d8e", "429bbf7f-096d-4c4e-a269-9c1c98160704", "74e574bd-2fb3-4d18-bec2-e5c595fd7ec4", "e05ef9ff-215c-4f75-8293-29dcc6501d41"], "2349f171-44f0-4156-8825-8dccb382284b": ["5ef594b8-7631-11e4-a3cb-005056011aef", "ccd49f18-18ec-40db-b0d6-9ceb837c0bf2", "5ef5aca0-7631-11e4-a3cb-005056011aef", "cf7b53da-bd10-497c-be00-8a95305f3d2d", "160eb9d9-c8d3-41da-a292-ccf07e0fa08f"], "4144624e-fe0c-4e1e-82dd-43eb632d9d03": ["6c3c4f8a-5c38-4700-85e2-4313275fea56", "404eb764-7d0f-4d03-a95f-d5d00a397ce3", "02af3c3a-078c-4de1-a514-74ea146102db", "c52fa2cb-a589-49c6-b97c-17c6dcf553f0", "a02b0555-4da6-46ce-bb61-157ff823b2fd"]}
    # but GdsApi::ContentStore.content_store(base_path)
    # so have asked him if he can include the basepaths

    links = {
      "suggested_ordered_related_items": [
        {
          "content_id": "774cee22-d896-44c1-a611-e3109cce8eae",
          "title": "Coronavirus (COVID-19): guidance and support",
          "locale": "en",
          "api_path": "/api/content/coronavirus",
          "base_path": "/coronavirus",
          "document_type": "coronavirus_landing_page",
          "public_updated_at": "2020-12-23T15:27:18Z",
          "schema_name": "coronavirus_landing_page",
          "withdrawn": false,
          "description": "Find information on coronavirus, including guidance, support, announcements and statistics.",
          "links": {},
          "api_url": "https://www.gov.uk/api/content/coronavirus",
          "web_url": "https://www.gov.uk/coronavirus",
        },
        {
          "content_id": "b32fd0f5-b2fa-45c5-8fe8-8715a0f6574b",
          "title": "Making a support bubble with another household",
          "locale": "en",
          "api_path": "/api/content/guidance/making-a-support-bubble-with-another-household",
          "base_path": "/guidance/making-a-support-bubble-with-another-household",
          "document_type": "detailed_guide",
          "public_updated_at": "2021-01-15T16:40:21Z",
          "schema_name": "detailed_guide",
          "withdrawn": false,
          "links": {},
          "api_url": "https://www.gov.uk/api/content/guidance/making-a-support-bubble-with-another-household",
          "web_url": "https://www.gov.uk/guidance/making-a-support-bubble-with-another-household",
        },
      ],
    }
    links = links.to_json

    JSON.parse(links).fetch("suggested_ordered_related_items")
  end
end
