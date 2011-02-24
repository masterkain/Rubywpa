class Fastweb
  def self.compute(ssid)
    begin
      seq_20 = "\x22\x33\x11\x34\x02\x81\xFA\x22\x11\x41\x68\x11\x12\x01\x05\x22\x71\x42\x10\x66";
      serial_number_bytes = ssid.split('-')[2].scan(/[a-f0-9]{2}/i)
      str = ''
      (0..5).each{ |idx| str << serial_number_bytes[idx].hex.chr }
      str << seq_20

      # MD5
      str_long = ''
      Digest::MD5.hexdigest(str).scan(/[a-f0-9]{2}/i).each{ |byte| str_long << byte.hex.to_s(2).rjust(8, '0') }

      # HEX
      hex_5 = []
      i = 0
      while i < 25
        n = str_long[i, 5].to_i(2)
        if n > 0x0a
          hex_5 << (n + 0x57)
        else
          hex_5 << n
        end
        i += 5
      end

      # WPA
      wpa = ''
      hex_5.each{ |hex| wpa << sprintf("%02x", hex) }
      wpa
    rescue Exception => e
      "Fastweb parser raised: SSID not supported yet"
    end
  end
end
