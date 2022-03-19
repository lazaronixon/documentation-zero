module Documentation
  module Generators
    class ScaffoldGenerator < Rails::Generators::NamedBase
      argument :attributes, type: :array, default: [], banner: "field:type field:type"

      class_option :timestamps, type: :boolean, default: true

      source_root File.expand_path("templates", __dir__)

      def copy_files
        template "resource.md", ".documentation_api/sections/#{plural_file_name}.md"
      end
    end
  end
end
