# frozen_string_literal: true

require "erb"
require "tempfile"
require_relative "./govwifi_eapoltest/version"
require_relative "./matchers/eapoltest_matchers"
require_relative "./services"
class GovwifiEapoltest
  PEAP_MSCHAP_TEMPLATE_PATH = "#{File.dirname(__FILE__)}/../templates/peap-mschapv2.conf.erb".freeze
  EAP_TLS_TEMPLATE_PATH = "#{File.dirname(__FILE__)}/../templates/eap-tls.conf.erb".freeze
  SSID = "GovWifi"

  def initialize(radius_ips:, secret:, client_mac: nil)
    @radius_ips = radius_ips
    @secret = secret
    @client_mac = client_mac
  end

  def run_peap_mschapv2(username:, password:, server_cert_path: nil, tls_version: :tls1_2, client_mac: nil)
    raise "Unknown TLS version #{tls_version}" unless %i[tls1_0 tls1_1 tls1_2 tls1_3].include?(tls_version)

    phase1_tls1_0 = "tls_disable_tlsv1_0=#{tls_version == :tls1_0 ? 0 : 1}"
    phase1_tls1_1 = "tls_disable_tlsv1_1=#{tls_version == :tls1_1 ? 0 : 1}"
    phase1_tls1_2 = "tls_disable_tlsv1_2=#{tls_version == :tls1_2 ? 0 : 1}"
    phase1_tls1_3 = "tls_disable_tlsv1_3=#{tls_version == :tls1_3 ? 0 : 1}"

    phase1 = [phase1_tls1_0, phase1_tls1_1, phase1_tls1_2, phase1_tls1_3].join(" ")

    variables = {
      ssid: SSID,
      identity: username,
      password:,
      server_cert_path:,
      phase1:,
      client_mac:,
    }

    run_eapol(PEAP_MSCHAP_TEMPLATE_PATH, variables:)
  end

  def run_eap_tls(client_cert_path:, client_key_path:, server_cert_path: nil, client_mac: nil)
    variables = {
      server_cert_path:,
      client_cert_path:,
      client_key_path:,
      client_mac:,
    }

    run_eapol(EAP_TLS_TEMPLATE_PATH, variables:)
  end

private

  def run_eapol(config_template_path, variables: {})
    client_mac = variables.delete(:client_mac)
    file = Tempfile.new
    file.write ERB.new(File.read(config_template_path), trim_mode: "-").result_with_hash(variables)
    file.close
    @radius_ips.map do |radius_ip|
      Services.eapol_test.run(
        config_file_path: file.path,
        radius_ip:,
        secret: @secret,
        client_mac:,
      )
    end
  ensure
    file.unlink
  end
end
