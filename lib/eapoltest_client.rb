# frozen_string_literal: true

class EapoltestClient
  DEFAULT_CLIENT_MAC = "f5:23:78:27:71:2c"

  def self.run(config_file_path: nil, radius_ip: nil, secret: nil, client_mac: DEFAULT_CLIENT_MAC)
    client_mac ||= DEFAULT_CLIENT_MAC
    `eapol_test -t9 -c #{config_file_path} -a #{radius_ip} -s #{secret} -M #{client_mac}`
  end
end
