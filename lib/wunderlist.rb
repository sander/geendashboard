class Wunderlist
  include HTTParty
  base_uri 'https://api.wunderlist.com'

  def login(email, password)
    self.class.post '/login', body: {
      email: email,
      password: password
    }
  end
end
