class Fxgoogle
  def self.recaptcha_verify(response)
    config = YAML.load_file(Rails.root.join("config/google.yml"))[Rails.env]
    uri = URI(config['verifyurl'])
      
    request = Net::HTTP::Post.new(uri.path)    
    request.set_form_data({
      "secret" => config['secretkey'], 
      "response" => response
    })
    
    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true
    response = http.request(request)
    
    j = JSON.parse(response.body)
    return j['success']
  end
  
  def self.ga_send_event(_cid, _t = "event", _ec, _ea, _el, _ev)
    config = YAML.load_file(Rails.root.join("config/google.yml"))[Rails.env]
    uri = URI(config['ga-endpoint'])
    request = Net::HTTP::Post.new(uri.path)    
    request.set_form_data({
      "v"     => config['ga-v'], 
      "tid"   => config['ga-property'], 
      "cid"   => _cid, 
      "t"     => _t, 
      "ec"    => _ec, 
      "ea"    => _ea, 
      "el"    => _el, 
      "ev"    => _ev
    })
    http = Net::HTTP.new(uri.hostname, uri.port)    
    response = http.request(request)
    
    return true
  end
end
