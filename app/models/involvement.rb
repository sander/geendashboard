class Involvement < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :role
end
