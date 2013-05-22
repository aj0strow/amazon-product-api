%w(helpers default_options base).each do |mod| 
  require "amazon_product_api/#{mod}"
end

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
  extend DefaultOptions
  
  reset_default_options

end