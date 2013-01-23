class Project < ActiveRecord::Base
  belongs_to :user, :foreign_key => "users"
end
