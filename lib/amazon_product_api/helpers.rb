require 'httparty'

module AmazonProductAPI
  module Helpers
    
    def sort_hash!(hash)
      tmp = hash.sort_by{ |k, v| k.to_s }
      hash.clear
      tmp.each{ |k, v| hash[k] = v }
      hash
    end
    
  end  
end