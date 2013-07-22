class User < ActiveRecord::Base
  has_many :involvements
  has_many :projects, through: :involvements
  has_many :roles, through: :involvements
  has_one :wunderlist_account

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.email = auth['info']['email']
    end
  end
end
