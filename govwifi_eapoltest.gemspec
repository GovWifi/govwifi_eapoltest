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
  spec.homepage = "https://github.com/alphagov/govwifi_eapoltest"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.4.7"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/alphagov/govwifi_eapoltest"
  spec.metadata["changelog_uri"] = "https://www.wifi.service.gov.uk/"
  spec.files = Dir["{templates,lib}/**/*"]
  spec.require_paths = %w[lib templates]
  spec.add_dependency "base64"
  spec.add_dependency "benchmark"
  spec.add_dependency "ostruct"
  spec.add_dependency "rspec"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rubocop-govuk"
end
