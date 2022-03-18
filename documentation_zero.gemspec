require_relative "lib/documentation_zero/version"

Gem::Specification.new do |spec|
  spec.name = "documentation-zero"
  spec.version = DocumentationZero::VERSION
  spec.authors = ["Nixon"]
  spec.email = ["lazaronixon@hotmail.com"]

  spec.summary = "An documentation system generator for Rails applications"
  spec.homepage = "https://github.com/lazaronixon/documentation-zero"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/lazaronixon/documentation-zero"
  spec.metadata["changelog_uri"] = "https://github.com/lazaronixon/documentation-zero/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
end
