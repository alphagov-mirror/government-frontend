class WeightedLinksPage
  include ActiveModel::Validations

  CONFIG_PATH = Rails.root.join("app/lib/weighted_links.yaml")

  attr_accessor :page_base_path, :related_links

  validates_presence_of :page_base_path, :related_links
  validate { errors.add(:related_links, "is not an array") unless related_links.is_a? Array }

  def initialize(attrs)
    attrs.each { |key, value| instance_variable_set("@#{key}", value) }
    validate!
  end

  def self.load(params)
    new(params)
  end

  # YAML.load_file(CONFIG_PATH)["questions"].map { |q| load(q) }
  # 1. Load YAML file
  # 2. Iterate over each entry in YAML
  # 3. Parse and instantiate class object on each
  # 4. Parse and instantiate class for each Related Link
end
