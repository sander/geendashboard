class Wunderlist
  include HTTParty
  base_uri 'https://api.wunderlist.com'
  attr_accessor :token

  def login(email, password)
    self.class.post '/login', body: {
      email: email,
      password: password
    }
  end

  def get(path)
    self.class.get path, headers: {
      'Authorization' => "Bearer: #{token}"
    }
  end
end
