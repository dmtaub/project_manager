class Project < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id

  def self.statuses
    ["Not Started", "In Progress", "Paused", "Finished"]
  end
  def self.displayColumns
    ["project","target_completion","status","notes"]
  end
end
