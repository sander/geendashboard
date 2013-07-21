module ApplicationHelper
  def avatar_url user
    default_url = 'retro'
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=32&d=#{CGI.escape(default_url)}"
  end
end
