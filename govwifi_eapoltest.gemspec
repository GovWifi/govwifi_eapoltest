# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "govwifi_eapoltest/version"

Gem::Specification.new do |spec|
  spec.name = "govwifi_eapoltest"
  spec.version = GovwifiEapoltest::VERSION
  spec.authors = %w[koetsier]
  spec.email = ["jos.koetsier@digital.cabinet-office.gov.uk"]

  spec.summary = "Test helpers for Freeradius"
  spec.description = "These are a set of helpers to test Freeradius."
  spec.homepage = "https://github.com/govwifi/govwifi_eapoltest"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/govwifi/govwifi_eapoltest"
  spec.metadata["changelog_uri"] = "https://www.wifi.service.gov.uk/"
  spec.files = Dir["{templates,lib}/**/*"]
  spec.require_paths = %w[lib templates]
  spec.add_dependency "base64", ">= 0.3.0"
  spec.add_dependency "benchmark", ">= 0.5.0"
  spec.add_dependency "ostruct", ">= 0.6.3"
  spec.add_dependency "rspec", ">= 3.12.0"
  spec.add_development_dependency "rake", ">= 13.0.0"
  spec.add_development_dependency "rubocop-govuk", ">= 1.79.0"
end
