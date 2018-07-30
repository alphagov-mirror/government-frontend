require 'test_helper'

class ServicesTest < ActiveSupport::TestCase
  include RummagerHelpers

  test "services returns no results if taxon ids is a blank array" do
    services = Supergroups::Services.new("/a-random-path", [])
    refute services.any_services?
  end

  test "services returns no results if there are taxon ids but no results" do
    taxon_content_ids = ['any-old-taxon', 'some-other-taxon-id']

    stub_most_popular_content("/a-random-path", taxon_content_ids, 0, "services")
    services = Supergroups::Services.new("/a-random-path", taxon_content_ids)
    refute services.any_services?
  end

  test "tagged_content returns hash with with 2 featured items and 0 normal items with 2 results" do
    taxon_content_ids = ['any-old-taxon', 'some-other-taxon-id']

    stub_most_popular_content("/a-random-path", taxon_content_ids, 2, "services")

    services = Supergroups::Services.new("/a-random-path", taxon_content_ids)

    assert services.any_services?
    assert_equal 0, services.tagged_content.count
    assert_equal 2, services.promoted_content.count
  end

  test "tagged_content returns hash with with 3 featured items and 2 normal items if there are enough results" do
    taxon_content_ids = ['any-old-taxon', 'some-other-taxon-id']

    stub_most_popular_content("/a-random-path", taxon_content_ids, 5, "services")

    services = Supergroups::Services.new("/a-random-path", taxon_content_ids)

    assert services.any_services?
    assert_equal 2, services.tagged_content.count
    assert_equal 3, services.promoted_content.count
  end
end
