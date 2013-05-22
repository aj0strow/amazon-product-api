require 'test_helper'

class HelpersTest < Test
  
  test 'sort hash' do
    h = { b: 5, c: 3, a: 2 }
    AmazonProductAPI.sort_hash!(h)
    assert_equal [[:a, 2], [:b, 5], [:c, 3]], h.to_a
  end
    
end