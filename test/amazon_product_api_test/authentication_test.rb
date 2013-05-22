require 'test_helper'

class AuthenticationTest < Test
  
  setup do
    
    str = %w[
      AWSAccessKeyId=AKIAIOSFODNN7EXAMPLE&
      AssociateTag=mytag-20&
      BrowseNodeId=465600&
      Operation=BrowseNodeLookup&
      ResponseGroup=BrowseNodeInfo%2CTopSellers%2CNewReleases%2CMostWishedFor%2CMostGifted&
      Service=AWSECommerceService&
      Timestamp=2009-01-01T12%3A00%3A00Z&
      Version=2009-01-01
    ].join
    
    @signature_data = ['GET', 'webservices.amazon.com', '/onca/xml', str].join("\n")
    
    @params = {
      Service: 'AWSECommerceService',
      AWSAccessKeyId: 'AKIAIOSFODNN7EXAMPLE',
      Operation: 'BrowseNodeLookup',
      Version: '2009-01-01',
      BrowseNodeId: '465600',
      AssociateTag: 'mytag-20',
      ResponseGroup: 'BrowseNodeInfo,TopSellers,NewReleases,MostWishedFor,MostGifted',
      Timestamp: '2009-01-01T12:00:00Z'
    }
  end
  
  test 'signature data' do
    sig_data = AmazonProductAPI.send(:signature_data, @params)
    assert_equal @signature_data, sig_data
  end
  
  test 'signature' do
    AmazonProductAPI.set({
      aws_secret_key: '1234567890',
      locale: :us
    })
    
    options = {
      AWSAccessKeyId: 'AKIAIOSFODNN7EXAMPLE',
      ItemId: '0679722769',
      Operation: 'ItemLookup',
      ResponseGroup: 'ItemAttributes,Offers,Images,Reviews',
      Service: 'AWSECommerceService',
      Timestamp: '2009-01-01T12:00:00Z',
      Version: '2009-01-06'
    }
    
    sig = AmazonProductAPI.send(:signature, options)
    assert_equal 'M/y0+EAFFGaUAp4bWv/WEuXYah99pVsxvqtAuC8YN7I=', sig
  end
  
end