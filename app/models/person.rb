class Person < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :group_id
  belongs_to :group
  
  has_and_belongs_to_many :skills, dependent: :destroy
  
  

end
