# Amazon Product API

This gem is a wrapper for the amazon product api so you don't have to figure out how to sign requets. 

![](http://fbcdn-sphotos-a-a.akamaihd.net/hphotos-ak-ash4/1001782_10151715655417269_1172962511_n.jpg)

### Set Default Values

```ruby
AmazonProductAPI.set({
  aws_access_key: '********************',
  aws_secret_key: '****************************************',
  associate_tag: '*******-20',
  locale: :ca
})
```

### Use the API

```ruby
AmazonProductAPI.get({
  Operation: 'ItemSearch',
  SearchIndex: 'Books',
  ResponseGroup: 'Small,Images,AlternateVersions',
  Author: 'J K Rowling',
  Title: 'Harry Potter'
})
```

Or use the book shorthand:

```ruby
AmazonProductAPI.search_book('J K Rowling', 'Harry Potter')
```

The results come back in a ruby hash:

```
{"ItemSearchResponse"=>
  {"OperationRequest"=>
    {"RequestId"=>"12e39370-f0a9-43ac-952e-3655a880fa15",
     "Arguments"=>
      {"Argument"=> [ .. snip .. ]},
     "RequestProcessingTime"=>"1.0705810000000000"},
   "Items"=>
    {"Request"=>
      {"IsValid"=>"True",
       "ItemSearchRequest"=>
        {"Author"=>"J K Rowling",
         "ResponseGroup"=>["Small", "Images", "AlternateVersions"],
         "SearchIndex"=>"Books",
         "Title"=>"Harry Potter"}},
     "TotalResults"=>"786",
     "TotalPages"=>"79",
		 ...
```

### Installation

Add the following line to your `Gemfile`

```
gem 'amazon_product_api', github: 'aj0strow/amazon_product_api'
```