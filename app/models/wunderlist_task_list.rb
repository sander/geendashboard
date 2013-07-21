class WunderlistTaskList < ActiveRecord::Base
  belongs_to :project
  belongs_to :wunderlist_account

  def tasks
    JSON.parse(read_attribute(:tasks)).select do |task|
      not task['parent_id']
    end.sort_by do |task|
      [false, true].index(!!task['completed_by_id']) * 9001 +
        task['position'].to_f
    end
  end
end
