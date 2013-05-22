module AmazonProductAPI
  module DefaultOptions
    
    # params
    #  locale: :ca
    #  associate_tag: '********-20'
    #  aws_access_key: '********************'
    #  aws_secret_key: '********************'
    #  version: 'YYYY-MM-DD'
    def set(params)
      @locale = params[:locale].to_s.downcase.to_sym if params[:locale]
      @aws_secret_key = params[:aws_secret_key] if params[:aws_secret_key]
      @default_options[:AWSAccessKeyId] = params[:aws_access_key] if params[:aws_access_key]
      @default_options[:AssociateTag] = params[:associate_tag] if params[:associate_tag]
      @default_options[:Version] = params[:version] if params[:version]
      params.keys
    end
    
    def defaults
      @default_options
    end
    
    def add_defaults(options)
      defaults.each{ |k, v| options[k] ||= v }
    end
    
    def reset_default_options
      @default_options = {
        Service: 'AWSECommerceService',
        Version: '2011-08-01'
      }
      @locale = :us
      @aws_secret_key = nil
    end
    
  end
end