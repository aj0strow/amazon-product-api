require 'openssl'

module AmazonProductAPI
  module Base
    
    def domain
      "webservices.amazon.#{LOCALES[@locale]}"
    end
    
    def url
      "http://#{domain}/onca/xml"
    end
    
    def timestamp
      date, time = Time.now.utc.to_s.split(' ')
      "#{date}T#{time}Z"
    end
    
    def signature_data(options)
      sort_hash! options
      query = HTTParty::HashConversions.to_params(options)
      ['GET', domain, '/onca/xml', query].join("\n")
    end
    
    def signature(options)
      data = signature_data(options)
      sha256 = OpenSSL::Digest::SHA256.new
      digest = OpenSSL::HMAC.digest(sha256, @aws_secret_key, data)
      Base64.encode64(digest).strip
    end
    
  end
end