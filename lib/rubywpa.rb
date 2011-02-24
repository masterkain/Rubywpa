require 'digest/md5'
#require 'lib/rubywpa/version'
require 'lib/rubywpa/networks/alice'
require 'lib/rubywpa/networks/fastweb'

module Rubywpa
  class WiFi
    attr_accessor :ssid

    # Create a new rubywpa instance and set the SSID.
    #
    #   wifi = RubyWPA.new({
    #     :ssid => "MY_SSID",
    #     :mac  => "My_mac_address" # required for some networks
    #   })
    #   wifi.password
    #
    def initialize(options = {}, &block)
      @ssid         = options[:ssid]
      @mac          = options[:mac]
      @country_code = options[:country_code]

      yield self if block_given?
    end

    def password
      case
      when fastweb?      then Fastweb.compute(ssid)
      when alice?        then Alice.compute(ssid)
      else
        'Network not supported!'
      end
    end

    def fastweb?
      !!(ssid =~ /^FASTWEB/i)
    end

    def alice?
      !!(ssid =~ /^Alice/i)
    end
  end
end
