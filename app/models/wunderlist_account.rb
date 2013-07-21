require 'wunderlist'

class WunderlistAccount < ActiveRecord::Base
  belongs_to :user

  def lists
    wunderlist.get '/me/lists'
  end

  def items(list_id)
    wunderlist.get('/me/tasks').select { |task| task['list_id'] == list_id }
  end

  private
    def wunderlist
      wunderlist = Wunderlist.new
      wunderlist.token = token
      wunderlist
    end
end
