module Documentation
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      argument :attributes, type: :array, default: [], banner: "field:type field:type"
      source_root File.expand_path("templates", __dir__)
    end
  end
end
