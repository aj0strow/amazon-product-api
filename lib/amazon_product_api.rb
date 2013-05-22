require 'amazon_product_api/helpers'
require 'amazon_product_api/options'
require 'amazon_product_api/base'

module AmazonProductAPI
  
  LOCALES = {
    ca: 'ca',
    cn: 'cn',
    de: 'de',
    es: 'es',
    fr: 'fr',
    it: 'it',
    jp: 'co.jp',
    uk: 'co.uk',
    us: 'com'
  }
  
  extend Helpers
  extend Base
  extend Options
  
  reset_default_options
  
end