class WunderlistTaskList < ActiveRecord::Base
  belongs_to :project
  belongs_to :wunderlist_account
end
