class Person < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :group_id
  validates :group_id, presence: true
  belongs_to :group
  belongs_to :user
  has_and_belongs_to_many :skills, dependent: :destroy
  
  

end
