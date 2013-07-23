module ApplicationHelper
  def avatar_url user, size = 32
    default_url = 'retro'
    gravatar_id = Digest::MD5.hexdigest user.email.downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}&d=#{CGI.escape(default_url)}"
  end
end
