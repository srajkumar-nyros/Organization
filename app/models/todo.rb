class Todo < ActiveRecord::Base
	has_many :comments
	belongs_to :user
	belongs_to :person

end
