module Documentation
  module Generators
    class ReadmeGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      class_option :directory, type: :string, default: ".api"

      def copy_files
        template "README.md", "#{options.directory}/README.md"
      end

      private
        def application_name
          if defined?(Rails) && Rails.application
            Rails.application.class.name.split("::").first.underscore
          else
            "application"
          end
        end
    end
  end
end
