class Project < ActiveRecord::Base
  has_many :involvements
  has_one :wunderlist_task_list
end
