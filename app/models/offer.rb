class Offer
  def self.find(params)
    response = Hurley.get(request_url(params))
    if valid?(response)
      JSON.parse(response.body)["offers"]
    else
      "The response signature received is invalid."
    end
  end

  private
  
  def self.request_url(params)
    endpoint + "?" + parameters_plus_hashkey(params)
  end

  def self.endpoint
    "http://api.fyber.com/feed/v1/offers.json"
  end

  def self.parameters_plus_hashkey(params)
    base_parameters(params) + "&" + "hashkey=" + hash_key(params)
  end

  def self.base_parameters(params)
    "appid=157"\
    "&device_id=2b6f0cc904d137be2e1730235f5664094b83"\
    "&ip=109.235.143.113"\
    "&locale=de"\
    "&offer_types=112"\
    "&pub0=#{params['pub0']}"\
    "&timestamp=#{Time.now.to_i}"\
    "&uid=#{params['uid']}"\
  end

  def self.hash_key(params)
    Digest::SHA1.hexdigest(base_parameters(params) + "&#{ENV["fyber_api_key"]}")
  end

  def self.valid?(response)
    response_signature = response.header["X-Sponsorpay-Response-Signature"]
    valid_signature = Digest::SHA1.hexdigest(response.body + ENV["fyber_api_key"])
    response_signature == valid_signature ? true : false
  end
end
