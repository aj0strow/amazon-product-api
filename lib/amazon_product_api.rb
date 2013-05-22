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
  
  @default_options = {
    Service: 'AWSECommerceService',
    Version: '2011-08-01'
  }
  
  @locale = :us
  
  class << self
    
    # params
    #  locale: :ca
    #  associate_tag: '********-20'
    #  aws_access_key: '********************'
    #  aws_secret_key: '********************'
    def set(params)
      @locale = params[:locale].to_s.downcase.to_sym if params[:locale]
      @aws_secret_key = params[:aws_secret_key] if params[:aws_secret_key]
      @default_options[:AWSAccessKeyId] = params[:aws_access_key] if params[:aws_access_key]
      @default_options[:AssociateTag] = params[:associate_tag] if params[:associate_tag]
      params.keys
    end
    
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
    
    def signature_data(params)
      
    end
    
  end
  
end