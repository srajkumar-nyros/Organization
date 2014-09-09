class Group < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :organization_id
  belongs_to :organization
  
  has_many :people, dependent: :destroy
  has_many :skills, dependent: :destroy
end
