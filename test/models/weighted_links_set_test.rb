require "test_helper"

class WeightedLinksPageTest < ActiveSupport::TestCase
  test "is invalid without any attributes" do
    attrs = {}

    assert_raise do
      WeightedLinksPage.new(attrs)
    end
  end

  test "is invalid without any related links" do
    attrs = {
      "page_base_path" => "/coronavirus",
    }

    assert_raise do
      WeightedLinksPage.new(attrs)
    end
  end

  test "has errors if related links are not an array" do
    attrs = {
      "page_base_path" => "/coronavirus",
      "related_links" => "not an array",
    }

    assert_raise do
      page = WeightedLinksPage.new(attrs)
      assert_not_empty page.errors.messages
    end
  end

  test "valid" do
    attrs = {
      "page_base_path" => "/coronavirus",
      "related_links" => %w[stuff in here],
    }
    page = WeightedLinksPage.new(attrs)

    assert page.valid?
    assert_empty page.errors.messages
  end

  test "load" do
    attrs = {
      "page_base_path" => "/coronavirus",
      "related_links" => %w[stuff in here],
    }

    page = WeightedLinksPage.load(attrs)
    assert_equal "/coronavirus", page.page_base_path
    assert page.related_links.first.is_a?(RelatedLink)
  end
end
