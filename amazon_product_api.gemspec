$:.push File.expand_path("../lib", __FILE__)
require 'amazon_product_api/version'

Gem::Specification.new do |s|
  s.version = AmazonProductAPI::VERSION
  s.name = 'amazon_product_api'
  s.summary = 'Amazon Product API'
  s.description = 'A wrapper for the Amazon Product API'
  s.date = '2013-05-22'
  s.authors = [ 'aj0strow' ]
  s.email = 'alexander.ostrow@gmail.com'
  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- test`.split("\n")
  s.require_paths = [ 'lib' ]
end
