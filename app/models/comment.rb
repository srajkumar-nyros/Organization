class Comment < ActiveRecord::Base
	belongs_to :todos
end
