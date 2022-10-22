def capital_of(country)
  case country
  when :japan
    'tokyo'
  when :china
    'beijing'
  when :france
    'paris'
  else
    raise ArgumentError, "無効な国名です。#{country}"
  end
end

capital_of(:china) # => "beijing"
capital_of(:italy) # => ArgumentError: 無効な国名です。italy

