# GovwifiEapoltest

This Gem is used to test FreeRADIUS installations

## Usage

Initialize the test with:
```ruby
eapol_test = GovwifiEapoltest.new(
  radius_ips: ["10.0.0.1", "10.0.0.2"], 
  secret: "mysecret"
)
```

By default, the client MAC address used is `f5:23:78:27:71:2c`. You can override this by passing the optional `client_mac` parameter:
```ruby
eapol_test = GovwifiEapoltest.new(
  radius_ips: ["10.0.0.1", "10.0.0.2"], 
  secret: "mysecret",
  client_mac: "00:11:22:33:44:55"
)
```

And then to run a PEAP MSCHAP test run:
```ruby
eapoltest.run_peap_mschapv2(server_cert_path: "/path/to/server/certificate.pem, 
                            username: "ABCDEF", 
                            password: "BearCatDuck",
                            tls_version: :tls1_2)
```

The output is an array with the contents of the output of the Eapol_test command run against each server.
                
## Matchers

The gem also provides a set of RSpec matchers to facilitate testing.

```ruby
expect(output).to use_tls_version_1_0
expect(output).to use_tls_version_1_1
expect(output).to use_tls_version_1_2
expect(output).to use_tls_version_1_3
expect(output).to have_been_successful
expect(output).to have_failed
```

## Development

A Makefile is provided to assist with local development:

- **Install dependencies**:
  ```bash
  make install
  ```
  By default, it uses `bundle`. If you need to specify a custom bundler (e.g., using `rbenv`):
  ```bash
  make install BUNDLER="rbenv exec bundle"
  ```

- **Run linter (RuboCop)**:
  ```bash
  make lint
  ```

- **Run tests (RSpec)**:
  ```bash
  make test
  ```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
