require 'minitest/autorun'
require 'amazon_product_api'


module TestHelpers
  module ClassMethods
    
    def test(name, &block)
      test_name = name.split.unshift('test').join('_')
      define_method test_name, &block
    end
    
    def setup(&block)
      define_method 'setup', &block
    end
    
    def teardown(&block)
      define_method 'teardown', &block
    end
    
  end
  
  def self.included(base)
    base.extend ClassMethods
  end
end


class Test < MiniTest::Unit::TestCase
  include TestHelpers
end
