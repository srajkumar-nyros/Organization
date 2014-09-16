class Organization < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  has_many :groups, dependent: :destroy
  belongs_to :user

end
