class Project < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id

  def self.statuses
    ["Not Started", "In Progress", "Blocked", "Paused", "Finished"]
  end
  def self.displayColumns
    ["user","project","target_completion","status","notes"]
  end
end
