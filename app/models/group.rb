class Group < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :organization_id
  
  validates :organization_id, presence: true
  
  belongs_to :organization
  belongs_to :user
  has_many :people, dependent: :destroy
  has_many :skills, dependent: :destroy
end
